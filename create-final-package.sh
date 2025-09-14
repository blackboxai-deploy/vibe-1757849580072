#!/bin/bash

echo "🎨 Creating Shobha Beauty Studio - Nails Focused Website Package..."

# Remove old package if exists
rm -rf shobha-nails-website
rm -f shobha-nails-website.tar.gz

# Create new package directory
mkdir -p shobha-nails-website

# Copy essential files
echo "📁 Copying source files..."
cp -r src/ shobha-nails-website/
cp -r public/ shobha-nails-website/
cp -r .next/ shobha-nails-website/ 2>/dev/null || echo "Build files will be generated"

# Copy configuration files
echo "⚙️ Copying configuration..."
cp package.json shobha-nails-website/
cp package-lock.json shobha-nails-website/ 2>/dev/null || echo "No package-lock.json"
cp pnpm-lock.yaml shobha-nails-website/ 2>/dev/null || echo "No pnpm-lock.yaml"
cp next.config.ts shobha-nails-website/
cp tsconfig.json shobha-nails-website/
cp postcss.config.mjs shobha-nails-website/
cp components.json shobha-nails-website/
cp eslint.config.mjs shobha-nails-website/

# Copy documentation
echo "📚 Copying documentation..."
cp NAILS_FOCUSED_WEBSITE_README.md shobha-nails-website/README.md
cp DEPLOYMENT.md shobha-nails-website/ 2>/dev/null || echo "Creating deployment guide..."

# Create deployment guide
cat > shobha-nails-website/DEPLOYMENT.md << 'EOF'
# 🚀 Deployment Guide - Shobha Beauty Studio

## Quick Start
1. `npm install` or `pnpm install`
2. `npm run build` or `pnpm run build`
3. `npm start` or `pnpm start`
4. Visit http://localhost:3000

## Upload Your Nail Images
1. Add 8 nail photos to `/public/assets/nails/`
2. Name them: 1.jpg, 2.jpg, 3.jpg, 4.jpg, 5.jpg, 6.jpg, 7.jpg, 8.jpg
3. Update `src/components/NailsSlider.tsx` to use local paths
4. Rebuild: `npm run build`

## Deploy to Production
- **Vercel**: `vercel --prod`
- **Netlify**: Drag & drop build folder
- **Traditional Hosting**: Upload .next folder contents

## Custom Domain
Update `metadataBase` in `src/app/layout.tsx` to your domain.

🌐 **Target Domain**: www.shobhabeautystudio.com
EOF

# Create image replacement guide
cat > shobha-nails-website/REPLACE_IMAGES.md << 'EOF'
# 📸 Image Replacement Guide

## Nail Slider Images
Replace these 8 images in the main slider:

1. `/public/assets/nails/1.jpg` - Featured nail design
2. `/public/assets/nails/2.jpg` - French manicure style
3. `/public/assets/nails/3.jpg` - Colorful nail art
4. `/public/assets/nails/4.jpg` - Bridal nail design
5. `/public/assets/nails/5.jpg` - Press-on nails showcase
6. `/public/assets/nails/6.jpg` - Gel manicure results
7. `/public/assets/nails/7.jpg` - Nail extensions
8. `/public/assets/nails/8.jpg` - Special occasion nails

## After Uploading Images
Update `src/components/NailsSlider.tsx`:

```typescript
const nailImages = [
  { src: '/assets/nails/1.jpg', alt: 'Your nail design description 1' },
  { src: '/assets/nails/2.jpg', alt: 'Your nail design description 2' },
  // ... etc for all 8 images
];
```

Then rebuild: `npm run build`
EOF

# Create package archive
echo "📦 Creating compressed package..."
tar -czf shobha-nails-website.tar.gz shobha-nails-website/

# Package stats
PACKAGE_SIZE=$(du -sh shobha-nails-website.tar.gz | cut -f1)
FILE_COUNT=$(find shobha-nails-website -type f | wc -l)

echo ""
echo "✅ Package Created Successfully!"
echo "📦 File: shobha-nails-website.tar.gz"
echo "💾 Size: $PACKAGE_SIZE"
echo "📄 Files: $FILE_COUNT total files"
echo ""
echo "🎯 Ready to Deploy:"
echo "   1. Extract the package"
echo "   2. Upload your 8 nail images"
echo "   3. Run 'npm install && npm run build'"
echo "   4. Deploy to www.shobhabeautystudio.com"
echo ""
echo "🌐 Live Preview: https://sb-1f7x42h8fxu7.vercel.run"