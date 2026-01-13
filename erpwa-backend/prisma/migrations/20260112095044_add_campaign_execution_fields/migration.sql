/*
  Warnings:

  - Added the required column `type` to the `Campaign` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "CampaignType" AS ENUM ('TEMPLATE', 'IMAGE');

-- CreateEnum
CREATE TYPE "ImageCaptionMode" AS ENUM ('NONE', 'TITLE', 'DESCRIPTION');

-- AlterTable
ALTER TABLE "Campaign" ADD COLUMN     "captionMode" "ImageCaptionMode",
ADD COLUMN     "categoryId" INTEGER,
ADD COLUMN     "completedAt" TIMESTAMP(3),
ADD COLUMN     "failedMessages" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "imageLimit" INTEGER DEFAULT 100,
ADD COLUMN     "sentMessages" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "startedAt" TIMESTAMP(3),
ADD COLUMN     "subCategoryId" INTEGER,
ADD COLUMN     "totalMessages" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "type" "CampaignType" NOT NULL;

-- CreateIndex
CREATE INDEX "Campaign_vendorId_idx" ON "Campaign"("vendorId");

-- CreateIndex
CREATE INDEX "Campaign_type_idx" ON "Campaign"("type");
