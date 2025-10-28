#!/usr/bin/env python3
"""
Script to merge split APKs into a single installable APK.

This script takes multiple split APK files (from an Android App Bundle)
and merges them into a single universal APK that can be installed on devices
without encountering INSTALL_FAILED_MISSING_SPLIT errors.

Usage: python3 merge_split_apks.py <splits-directory> <output-apk>
Example: python3 merge_split_apks.py instagram-splits instagram-alpha.apk
"""

import sys
import os
import zipfile
import tempfile
import shutil
from pathlib import Path


def find_base_apk(splits_dir):
    """Find the base APK in the splits directory."""
    # Look for base_apk.apk first
    base_candidates = [
        "base_apk.apk",
        "base.apk",
    ]
    
    for candidate in base_candidates:
        candidate_path = splits_dir / candidate
        if candidate_path.exists():
            print(f"Found base APK: {candidate}")
            return candidate_path
    
    # If not found by name, find the largest APK (usually the base)
    apk_files = list(splits_dir.glob("*.apk"))
    if not apk_files:
        return None
    
    largest_apk = max(apk_files, key=lambda p: p.stat().st_size)
    print(f"Using largest APK as base: {largest_apk.name}")
    return largest_apk


def merge_apks(splits_dir, output_apk):
    """Merge all split APKs into a single APK."""
    splits_path = Path(splits_dir)
    output_path = Path(output_apk)
    
    # Check if splits directory exists
    if not splits_path.exists() or not splits_path.is_dir():
        print(f"Error: Splits directory '{splits_dir}' does not exist")
        return False
    
    # Find all APK files
    apk_files = list(splits_path.glob("*.apk"))
    apk_count = len(apk_files)
    
    print(f"=== Merging Split APKs ===")
    print(f"Splits directory: {splits_dir}")
    print(f"Output APK: {output_apk}")
    print(f"Found {apk_count} APK files to merge")
    
    if apk_count == 0:
        print("Error: No APK files found")
        return False
    
    # If only one APK, just copy it
    if apk_count == 1:
        print("Only one APK found, copying directly...")
        shutil.copy2(apk_files[0], output_path)
        print(f"APK copied successfully: {output_apk}")
        return True
    
    # Find base APK
    base_apk = find_base_apk(splits_path)
    if not base_apk:
        print("Error: Could not find base APK")
        return False
    
    # Get all other splits
    split_apks = [apk for apk in apk_files if apk != base_apk]
    
    print(f"\nBase APK: {base_apk.name}")
    print(f"Split APKs to merge:")
    for split in split_apks:
        print(f"  - {split.name}")
    
    # Create temporary directory for merging
    with tempfile.TemporaryDirectory() as temp_dir:
        temp_path = Path(temp_dir)
        merged_path = temp_path / "merged"
        merged_path.mkdir()
        
        print("\nExtracting base APK...")
        # Extract base APK
        with zipfile.ZipFile(base_apk, 'r') as base_zip:
            base_zip.extractall(merged_path)
        
        # Remove META-INF to avoid signature issues
        meta_inf = merged_path / "META-INF"
        if meta_inf.exists():
            shutil.rmtree(meta_inf)
            print("Removed META-INF from base APK")
        
        # Merge each split APK
        for split_apk in split_apks:
            print(f"\nMerging: {split_apk.name}")
            with zipfile.ZipFile(split_apk, 'r') as split_zip:
                # Extract split to temporary location
                split_temp = temp_path / split_apk.stem
                split_temp.mkdir(exist_ok=True)
                split_zip.extractall(split_temp)
                
                # Remove META-INF from split
                split_meta_inf = split_temp / "META-INF"
                if split_meta_inf.exists():
                    shutil.rmtree(split_meta_inf)
                
                # Copy files from split to merged, avoiding duplicates
                for item in split_temp.rglob("*"):
                    if item.is_file():
                        relative_path = item.relative_to(split_temp)
                        target_path = merged_path / relative_path
                        
                        # Create parent directories if needed
                        target_path.parent.mkdir(parents=True, exist_ok=True)
                        
                        # Copy file if it doesn't exist or is different
                        if not target_path.exists():
                            shutil.copy2(item, target_path)
                            print(f"  Added: {relative_path}")
                        else:
                            # If file exists, keep the larger one (or merge for some files)
                            if item.stat().st_size > target_path.stat().st_size:
                                shutil.copy2(item, target_path)
                                print(f"  Replaced: {relative_path}")
        
        # Create the merged APK
        print(f"\nCreating merged APK: {output_apk}")
        with zipfile.ZipFile(output_path, 'w', zipfile.ZIP_DEFLATED) as output_zip:
            for item in merged_path.rglob("*"):
                if item.is_file():
                    arcname = item.relative_to(merged_path)
                    output_zip.write(item, arcname)
    
    # Verify output
    if not output_path.exists():
        print("Error: Failed to create merged APK")
        return False
    
    output_size = output_path.stat().st_size
    output_size_mb = output_size / (1024 * 1024)
    
    print(f"\n=== Merge Complete ===")
    print(f"Merged APK: {output_apk}")
    print(f"File size: {output_size_mb:.2f} MB")
    print("\nNote: The merged APK needs to be signed before installation.")
    
    return True


def main():
    if len(sys.argv) < 2:
        print("Usage: python3 merge_split_apks.py <splits-directory> [output-apk]")
        print("Example: python3 merge_split_apks.py instagram-splits instagram-alpha.apk")
        sys.exit(1)
    
    splits_dir = sys.argv[1]
    output_apk = sys.argv[2] if len(sys.argv) > 2 else "instagram-alpha.apk"
    
    success = merge_apks(splits_dir, output_apk)
    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()
