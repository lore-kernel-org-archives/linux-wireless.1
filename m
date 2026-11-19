Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110616;
	b=vRxKetLk7ybKtfnlmbXT9y0sTjFnObhhafehl1mNYuejp5SRj6IDPDDsVeVFYV6R1KRO
	 eh1Ni9f2VS6GXhPV6T3iYTWmewim/94b/uAKO9Lqoe9/ogXwuEkmrtZ8AO3yyZ6ut0tAs
	 qBEBmmdL4pZGqPgXGThSF3aOfrizGwvltoU7s6biHZw1tVvdPiGt0dFbZF4kJG9pfEyw0
	 BkEKimGBuNzoxJ1XivS2fwU5bCiz6Lg8OEyUbGxd360UNqjUJnDebSK+hfa1kpJoRtsFm
	 mgeaLcdW92MHjmMNaQHghCg9w7c4qdoxFCQAoiqvnJ1mvLfdsq17Fy0BosPDxEX1Prw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=biZE2CTLfp37QMWttMCLwen07TVkYszR0CyrzZrWaac=;
	b=1oFWAOfyAebJsXEe0QA6b/vvei0wlDLE81qYP6IKczftV99hmL48zYJvfF1Y0efBDIcl
	 pzsx8iVPaoUt5t9db+JyOHIivZ8S+AqQ59fR/lQT4moHHIgmlQnOT9I2VJ6/tLhzvalZ2
	 1XOrrwXEhkufyNNNJEpqagmv9FacIpoyodL3vTcOySPRnazqmjSAuSV7n/0PxirA788ar
	 8xYeEwzNrFLk0NZKtB5WJrkqsmtKRk4uGth5MR/fw7IJ45+jyTy3NSu0wsnOs8amtwwE6
	 xlv2h8cbas7ir36fHP/BNXrBbol6R/VEyYUi1JucWQup3tTUvszKLrdjPTnetATyJfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lSL5zlD1;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F09360A2626
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 17:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F09360A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lSL5zlD1
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso35274845e9.0
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110615; x=1795715415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=biZE2CTLfp37QMWttMCLwen07TVkYszR0CyrzZrWaac=;
        b=lSL5zlD1j7RAVJ1qICNT31/bpiBPPKF5PXRc6gv3yE2j5Dpkp9kwmh1JQV+sTW67wO
         WSmLhGumALbGklJZ6zRwIJBWEj11lGW+CtFtAt2mCZcypeOQVygOZvQO50+qg2hdjazp
         rHKPSNvXwJ1eZ4ZTj8y60BU/6lg5Qz4jIbV+y0ljR/2GxopDezI7xrwMKlT00/ryiAI3
         7YnvbDM6OYrSPij4e/Hp4VXpnvtnscg9UqUe/UiGnff9qAhT+BHN/bszIB8HNA4SRGG2
         fjeBGWCA+G8fz4TdFO05wV/dh1UkPq2Rcv6zZIPxGxkcRAKeBIUa+4F/yDQCuHSjZ4+0
         vvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110615; x=1795715415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=biZE2CTLfp37QMWttMCLwen07TVkYszR0CyrzZrWaac=;
        b=kaTPvxU86qmu1CuKixrdDSAfVdqQbZWwPQzwpd9e/QC6y1IVgqo4TB8a1J6a9qs2HL
         h4J5gu8sDSQmgu0PBXafLvK5r9U8TxUjcRoUW9hMVDIL8wLMoKP6Jk5gyIC7ujvwCBZ3
         fFoGRqK8UtubOrm2auSyxKlPaQIWLeyTA9mUNzLh1hiTN6oQVHWfMH6y36mHlQxKotrI
         orYPsiJh/DCyEujGSVgapG3IrhBc3vVz7/2l3Nf74nvWMZo3XFpZtni3uXld74XqdczN
         D6kF5NsJnT71o12xWTecF1+07avnCK3W9WVANjnA80ZQ+jli++h3COl8zawbsT867qS7
         I0Tw==
X-Gm-Message-State: APuU4Z+9NYDUrDAxy1uJ1ZTIkbzNm5eOl6o8NOvAjmcbQfS7o0Gr2Qc6
	0MoYpzPGppOTpshVuyF/YMsGJdkyf9AW3oVnautdidwG9QZiTxPvg09y7OFKR4xbDtrHqmXCzeH
	S4LlQPUM=
X-Gm-Gg: AYBFou2usvvNfmAudqNuqDuGU858Xn1nWbtrLJ5dEAP5ryI+aB5vlWMfGbeM2YiLrRP
	0LiRMU6JBaImJBbaAibKJ5kkjN59eA+NKJF0LMIqClqIbSnTPsb30acRvQ4pXt4aOuqYsnr+qw7
	5TuUY7mmTVq9FTPECWCPlgoTTTJAAjnJM7Jq9OcYPn5d5+AEPaIhxThD4JAoPy1bJH9vur5HXdF
	WQILz7MBElZ1vwYmNLwCbbghl9dzaXZ3493UrfZ3jvIuGfblR9CrvzmttAlZKQelcyx9OT2JUDP
	n02lSdia/eIsrfcKSoChxLQTP4iCocTL4ugWo81XJIZpPVV4YoGm3eH8vlJ05TZnFS6qidCyJ2+
	C1HBTjgwg1YpUZg5p/S8jwSpPHPtIo4XJ6U3XdkdVQP9lFwUX/u2H6sYvfSV8ioMV9LH+NYAotY
	FdC0XUsbfFEVYumGQFoy7LLK0HR9blx7umgDHddUQ/5BR9xbhQHpx4R8+P+HT592FwDSPvu62t1
	W7R1A5xfPSrG41AvzItSXRuDsfBUx5nC0VfhghjQdqS+qAer0TZJtMQyn1DNLuTnpqLX6bBHu4N
	2K2AvyTAlOCPISCg7FpXuFvu0GmZvdYq0MOhRhHDW4TMDticD31KZzxcbO0g4hq5SD1TS7+Xu0W
	Gtn/qe1749TKNiB+ZMkZ4OvljZtMjqy0U3bJCoh2myZf7Y4XIsc2x9r8eSG383p3reovEL0GpQi
	vhpf33IUhxDTJP6Oh5rkymaXI=
X-Received: by 2002:a05:600c:1c21:b0:4bb:52bd:a3c7 with SMTP id 5b1f17b1804b1-4bb88804d41mr6984725e9.6.1795110614628;
        Thu, 19 Nov 2026 09:50:14 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm939503f8f.52.2026.11.19.09.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:14 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 08/10] wifi: cw1200: load the XR819 bootloader into SRAM
Date: Thu, 19 Nov 2026 18:50:00 +0100
Message-ID: <20261119175002.458988-9-arthur@aheymans.xyz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119175002.458988-1-arthur@aheymans.xyz>
References: <20261119175002.458988-1-arthur@aheymans.xyz>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

XR819 shares the CW1x60 revision field but needs a first-stage loader
at 0x08000000. Write it before releasing the CPU from reset, then use
the existing firmware download path.

Prepared with OpenAI Codex.

Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 drivers/net/wireless/st/cw1200/cw1200.h |  8 +++
 drivers/net/wireless/st/cw1200/fwio.c   | 67 +++++++++++++++++++++++--
 drivers/net/wireless/st/cw1200/fwio.h   |  3 ++
 drivers/net/wireless/st/cw1200/hwio.h   |  1 +
 drivers/net/wireless/st/cw1200/main.c   | 37 +++++++++++---
 5 files changed, 105 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/cw1200.h b/drivers/net/wireless/st/cw1200/cw1200.h
index 6dc85ef6e0fa..b25b60d377f6 100644
--- a/drivers/net/wireless/st/cw1200/cw1200.h
+++ b/drivers/net/wireless/st/cw1200/cw1200.h
@@ -116,7 +116,9 @@ struct cw1200_common {
 		CW1200_HW_REV_CUT20 = 20,
 		CW1200_HW_REV_CUT22 = 22,
 		CW1X60_HW_REV       = 40,
+		XR819_HW_REV        = 41,
 	} hw_revision;
+	bool				is_xr819;
 	int                             hw_refclk;
 	bool				hw_have_5ghz;
 	const struct firmware		*sdd;
@@ -293,6 +295,12 @@ int cw1200_core_probe(const struct hwbus_ops *hwbus_ops,
 		      struct cw1200_common **pself,
 		      int ref_clk, const u8 *macaddr,
 		      const char *sdd_path, bool have_5ghz);
+int cw1200_core_probe_xr819(const struct hwbus_ops *hwbus_ops,
+			    struct hwbus_priv *hwbus,
+			    struct device *pdev,
+			    struct cw1200_common **pself,
+			    int ref_clk, const u8 *macaddr,
+			    const char *sdd_path);
 void cw1200_core_unregister(struct cw1200_common *self);
 void cw1200_core_release(struct cw1200_common *self);
 
diff --git a/drivers/net/wireless/st/cw1200/fwio.c b/drivers/net/wireless/st/cw1200/fwio.c
index 2a03dc533b6a..08b6f02e3ffd 100644
--- a/drivers/net/wireless/st/cw1200/fwio.c
+++ b/drivers/net/wireless/st/cw1200/fwio.c
@@ -14,6 +14,7 @@
 #include <linux/vmalloc.h>
 #include <linux/sched.h>
 #include <linux/firmware.h>
+#include <linux/unaligned.h>
 
 #include "cw1200.h"
 #include "fwio.h"
@@ -116,6 +117,11 @@ static int cw1200_load_firmware_cw1200(struct cw1200_common *priv)
 		if (!priv->sdd_path)
 			priv->sdd_path = SDD_FILE_CW1X60;
 		break;
+	case XR819_HW_REV:
+		fw_path = FIRMWARE_XR819;
+		if (!priv->sdd_path)
+			priv->sdd_path = SDD_FILE_XR819;
+		break;
 	default:
 		pr_err("Invalid silicon revision %d.\n", priv->hw_revision);
 		return -EINVAL;
@@ -128,9 +134,11 @@ static int cw1200_load_firmware_cw1200(struct cw1200_common *priv)
 	APB_WRITE(DOWNLOAD_STATUS_REG, DOWNLOAD_PENDING);
 	APB_WRITE(DOWNLOAD_FLAGS_REG, 0);
 
-	/* Write the NOP Instruction */
-	REG_WRITE(ST90TDS_SRAM_BASE_ADDR_REG_ID, 0xFFF20000);
-	REG_WRITE(ST90TDS_AHB_DPORT_REG_ID, 0xEAFFFFFE);
+	if (!priv->is_xr819) {
+		/* Write the NOP Instruction */
+		REG_WRITE(ST90TDS_SRAM_BASE_ADDR_REG_ID, 0xFFF20000);
+		REG_WRITE(ST90TDS_AHB_DPORT_REG_ID, 0xEAFFFFFE);
+	}
 
 	/* Release CPU from RESET */
 	REG_READ(ST90TDS_CONFIG_REG_ID, val32);
@@ -261,6 +269,45 @@ static int cw1200_load_firmware_cw1200(struct cw1200_common *priv)
 #undef REG_READ
 }
 
+static int cw1200_load_bootloader_xr819(struct cw1200_common *priv)
+{
+	const struct firmware *bootloader;
+	u32 addr = XR819_BOOT_BASE;
+	size_t i;
+	int ret;
+
+	ret = request_firmware(&bootloader, BOOTLOADER_XR819, priv->pdev);
+	if (ret) {
+		dev_err(priv->pdev, "can't load bootloader file %s\n",
+			BOOTLOADER_XR819);
+		return ret;
+	}
+
+	if (!bootloader->size || bootloader->size > U32_MAX - addr ||
+	    !IS_ALIGNED(bootloader->size, sizeof(u32))) {
+		dev_err(priv->pdev, "invalid bootloader size %zu\n", bootloader->size);
+		ret = -EINVAL;
+		goto release;
+	}
+
+	for (i = 0; i < bootloader->size; i += sizeof(u32), addr += sizeof(u32)) {
+		u32 word = get_unaligned_le32(bootloader->data + i);
+
+		ret = cw1200_reg_write_32(priv, ST90TDS_SRAM_BASE_ADDR_REG_ID,
+					  addr);
+		if (ret)
+			goto release;
+
+		ret = cw1200_reg_write_32(priv, ST90TDS_AHB_DPORT_REG_ID, word);
+		if (ret)
+			goto release;
+	}
+
+release:
+	release_firmware(bootloader);
+	return ret;
+}
+
 
 static int config_reg_read(struct cw1200_common *priv, u32 *val)
 {
@@ -443,8 +490,13 @@ int cw1200_load_firmware(struct cw1200_common *priv)
 		break;
 	}
 	case 4:
-		pr_info("CW1x60 silicon detected.\n");
-		priv->hw_revision = CW1X60_HW_REV;
+		if (priv->is_xr819) {
+			dev_info(priv->pdev, "XR819 silicon detected\n");
+			priv->hw_revision = XR819_HW_REV;
+		} else {
+			pr_info("CW1x60 silicon detected.\n");
+			priv->hw_revision = CW1X60_HW_REV;
+		}
 		break;
 	default:
 		pr_err("Unsupported silicon major revision %d.\n",
@@ -473,6 +525,11 @@ int cw1200_load_firmware(struct cw1200_common *priv)
 			ret = -ENOTSUPP;
 			goto out;
 		}
+		if (priv->is_xr819) {
+			ret = cw1200_load_bootloader_xr819(priv);
+			if (ret)
+				goto out;
+		}
 		ret = cw1200_load_firmware_cw1200(priv);
 		break;
 	default:
diff --git a/drivers/net/wireless/st/cw1200/fwio.h b/drivers/net/wireless/st/cw1200/fwio.h
index c287160a492e..a3effef6d500 100644
--- a/drivers/net/wireless/st/cw1200/fwio.h
+++ b/drivers/net/wireless/st/cw1200/fwio.h
@@ -25,6 +25,9 @@
 #define SDD_FILE_20		"sdd_20.bin"
 #define SDD_FILE_11		"sdd_11.bin"
 #define SDD_FILE_10		"sdd_10.bin"
+#define BOOTLOADER_XR819	"xr819/boot_xr819.bin"
+#define FIRMWARE_XR819		"xr819/fw_xr819.bin"
+#define SDD_FILE_XR819		"xr819/sdd_xr819.bin"
 
 int cw1200_load_firmware(struct cw1200_common *priv);
 
diff --git a/drivers/net/wireless/st/cw1200/hwio.h b/drivers/net/wireless/st/cw1200/hwio.h
index d1e629a566c2..376dd1525fe2 100644
--- a/drivers/net/wireless/st/cw1200/hwio.h
+++ b/drivers/net/wireless/st/cw1200/hwio.h
@@ -89,6 +89,7 @@ struct download_cntl_t {
 
 
 #define SYS_BASE_ADDR_SILICON		(0)
+#define XR819_BOOT_BASE			0x08000000
 #define PAC_BASE_ADDRESS_SILICON	(SYS_BASE_ADDR_SILICON + 0x09000000)
 #define PAC_SHARED_MEMORY_SILICON	(PAC_BASE_ADDRESS_SILICON)
 
diff --git a/drivers/net/wireless/st/cw1200/main.c b/drivers/net/wireless/st/cw1200/main.c
index ee9fcecb0100..998b8e45e503 100644
--- a/drivers/net/wireless/st/cw1200/main.c
+++ b/drivers/net/wireless/st/cw1200/main.c
@@ -515,12 +515,13 @@ u32 cw1200_dpll_from_clk(u16 clk_khz)
 	}
 }
 
-int cw1200_core_probe(const struct hwbus_ops *hwbus_ops,
-		      struct hwbus_priv *hwbus,
-		      struct device *pdev,
-		      struct cw1200_common **core,
-		      int ref_clk, const u8 *macaddr,
-		      const char *sdd_path, bool have_5ghz)
+static int __cw1200_core_probe(const struct hwbus_ops *hwbus_ops,
+			       struct hwbus_priv *hwbus,
+			       struct device *pdev,
+			       struct cw1200_common **core,
+			       int ref_clk, const u8 *macaddr,
+			       const char *sdd_path, bool have_5ghz,
+			       bool is_xr819)
 {
 	int err = -EINVAL;
 	struct ieee80211_hw *dev;
@@ -535,6 +536,7 @@ int cw1200_core_probe(const struct hwbus_ops *hwbus_ops,
 		goto err;
 
 	priv = dev->priv;
+	priv->is_xr819 = is_xr819;
 	priv->hw_refclk = ref_clk;
 	if (cw1200_refclk)
 		priv->hw_refclk = cw1200_refclk;
@@ -590,8 +592,31 @@ int cw1200_core_probe(const struct hwbus_ops *hwbus_ops,
 	*core = NULL;
 	return err;
 }
+
+int cw1200_core_probe(const struct hwbus_ops *hwbus_ops,
+		      struct hwbus_priv *hwbus,
+		      struct device *pdev,
+		      struct cw1200_common **core,
+		      int ref_clk, const u8 *macaddr,
+		      const char *sdd_path, bool have_5ghz)
+{
+	return __cw1200_core_probe(hwbus_ops, hwbus, pdev, core, ref_clk,
+				   macaddr, sdd_path, have_5ghz, false);
+}
 EXPORT_SYMBOL_GPL(cw1200_core_probe);
 
+int cw1200_core_probe_xr819(const struct hwbus_ops *hwbus_ops,
+			    struct hwbus_priv *hwbus,
+			    struct device *pdev,
+			    struct cw1200_common **core,
+			    int ref_clk, const u8 *macaddr,
+			    const char *sdd_path)
+{
+	return __cw1200_core_probe(hwbus_ops, hwbus, pdev, core, ref_clk,
+				   macaddr, sdd_path, false, true);
+}
+EXPORT_SYMBOL_GPL(cw1200_core_probe_xr819);
+
 /*
  * Removing the interfaces sends WSM commands, which need the device
  * interrupt for their confirmations, so the bus driver calls this before
-- 
2.56.0

