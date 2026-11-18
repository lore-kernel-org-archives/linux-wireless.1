Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044689;
	b=qqGDPLvReSe+5xMpWvohjTQ4M3eOdEaSR3g95UCO0lDm2ISryM6VG1GLj+RTMXBB8La8
	 ITf6VlHQcvz1GnlV5jBMBmbYtesVqYX7WmoZBwsFZLeXblGlZntQtYMBNevZIY+oQu2Oe
	 gVOrAwZkuSDmUQkYnKrTzSnbXeEX1rGTjSfl7inRD7f9thCBklqgupi7YULW7B805/XZK
	 bmrpEQckaqm/vOsPNgTPtaSNuBpXJpXkbe42SunOVaEx4oOBfvaCJYlZV7A8rEb+GteMc
	 e0VBCb9T1eU7q04LyHLqX+H1BdId/BxnnjFKvPQGfwIGRfySx8AExIXKlMrpycL/8mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NNnAsALgCl7D1RW8zxG9G0wZ5IXIckRuYCvhhwXJIq0=;
	b=uBu1NqEOGVvlfekqfD5k6AVfVhZQFQIcXgX+0+cmqirv7h7CuCsChO16j+KoMq7xgvOj
	 8VT430Np04du+wSBNEUtaOkrDmJbNqc1bO3aPFNyDnYSQOdFycJLw22fnI7Oj796NrUrJ
	 qxS4JHbVONOzGo4BUHbI3A9jX33vP8JLZFgj6ETR0tmfoAkygD+ZB2p8bsZNHHpEO3Z3B
	 mJEFtQ1b8P51Gcp9H2F6pJmA8Lox2U5BmliR7VxjUPsdP81GsUCI/ZcroxplJcFdja+wS
	 8RscmHtQviuQOWbYmiQ9AN7FgzQ5d4PzA3OxgAIaV05tiabU6MwaQJAUQr/1RzgaA/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QudL3igV;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D796D606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 23:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D796D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QudL3igV
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so240041b3a.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 15:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795044688; x=1795649488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNnAsALgCl7D1RW8zxG9G0wZ5IXIckRuYCvhhwXJIq0=;
        b=QudL3igV7qFmSRe8xn7G3wELwXsFswWiBSPEAk+Py4lVIY9KrKE2i4e0DhlzPUuFuo
         T9OMaeuhUZLn97+9P/wmUY7826bZJIIEp8C1742WW1rNgg73z906wsFJWWU3SmYAXg7o
         M9ZwEemUjJ0IbEU/m3/9Hp7rNXb8ckgmRI9fg4wKZ5KyofyYguEwBay2qshEfw6MfRzl
         W4mZb81bOSx2MzztRkeNb40kqtPEK2vm/1CEYPaqYz9G9/G5BmxeVmUoTzQxDEPL4i08
         kUTkCEc/u44VaqfifoKaVimAK20QWcNKDvllCFUetRe9E5lAB6rnbn5GeBLdS6rpePNE
         rI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044688; x=1795649488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NNnAsALgCl7D1RW8zxG9G0wZ5IXIckRuYCvhhwXJIq0=;
        b=laVILVhD+0m9hzBj0iBpHdIgSpmOO5oLG5xyaZEjU+xJmS0VEvwwcj33P4ycFrIle5
         ZPQkZdPZeju9aBQt3447nykCZxcLrDMUQMB3CKuNDnq83qL+hoVUnKUaY2ieVVSjdEKl
         RiQg96JQ/G5TWc2w58gd0JRRp1SubCmHQBW7jJAQ1dlAIGYIWbzkS96YPekdnCILNJdn
         6u+KGd75P3ad4URCD5KEnIZ0JmOc47yvifBoujJBZTmquoDjMfmQUojV0KgNIFLTPghh
         MCfA8hpsOERP8HWZ96DEXbuXh6MlVt+WAKFqTdkchPudX3ehLbblIz/kmCuuyqhEfYJC
         pWqg==
X-Forwarded-Encrypted: i=1; AL+hErGWjVDq91+t3xQiola2oQGCgB1Bf4hw13f4amf7OFSpDSbvPkYPAnXmlT/cihexYM9yhfJEoXmnGIZ8VeBZpQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+p/YdaU37KFic+jdsd+xRl5xYntLLqoah2zA08AG1YPXRwDGHq
	zLKnVROaSwE8qqUmE46QS4e7dm20lySQFFWfhHZT6eg8o55zXVe8e5V9WUeWMlwqWcI=
X-Gm-Gg: AYBFou0CzH2JFfc19PRz5dT5ueEPZP4o6zSGmq2Hx8E4dtK2D0AwAi7zr/sEm7Nz36/
	IIQMxQePondGTv/6IFC3VpGdE786Pm83FA16dmYFBScZ4kogTUVb3oFN04lB7w2hQDHXUmJHZRx
	BMayDoxsWFSj1jv1LZ4FcHM+wIE6P9HEgLcsUxVx9U0jBxcfBzb8D/mSivyqnFxNr8P+eZG1Rug
	Fxq+8l33ZuBVP52Ryco1F8oKjRuMnqCsgqtY19oIZOy/C6VySJNt3/QeHkTmIO9XSEsBSdmQHyT
	7Od84ViXUHz41LEMDZlBToQNS1KEwpP4GpodAzqzpNiDlWtlJlNfHKgfAMDRiaVs1V/EnEXhPbA
	9JZwWz/KJaTPz8Ibt+kGPA9YEIIbL2nqlJhIbzpbpZWNGqcvJqH9V8Fjnp2I/LBCeXf1j45U3Ak
	PUbfVdBWp9Zv8ZxOs5r9MGd4DK/U6vROv2pto8NuDELuUOxlkGrYOU5YSW1ze8xm/bNAP9D63cv
	bv7VHVRgHq3W6qR5gK8Mgak4kGIacMfjraHvoFmOrDp/jnWr2elnXxACdTGz1r3CQwcVyST/f3w
	z+tLUSyQ/pNnHHW3uFVT0cO3N/iokdjmEthCsxiyHhrTSZ3VteiYtxU5QcCfJvKYK8ofGYI1pFb
	ss7rxUfbKjAMqnsvzm3t7wllCq/Y=
X-Received: by 2002:a05:6a00:8c4:b0:8b6:ac2e:a340 with SMTP id d2e1a72fcca58-8c787508fd7mr13740b3a.16.1795044688262;
        Wed, 18 Nov 2026 15:31:28 -0800 (PST)
Received: from mma-H9MHD44.mymodem ([60.227.235.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c6660c2e4csm1467822b3a.22.2026.11.18.15.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:31:27 -0800 (PST)
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: lachlan.hodges@morsemicro.com,
	dan.callaghan@morsemicro.com
Cc: arien.judge@morsemicro.com,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless-next v2 2/4] wifi: mm81x: use the BCF size advertised by the firmware
Date: Thu, 19 Nov 2026 10:31:02 +1100
Message-ID: <20261118233104.1640855-3-lachlan.hodges@morsemicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118233104.1640855-1-lachlan.hodges@morsemicro.com>
References: <20261118233104.1640855-1-lachlan.hodges@morsemicro.com>
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

The BCF region in firmware memory grew from 1024 to 2048 bytes in v57
firmware, which now advertises the size of the region in its .fw_info
section. Use the advertised size to limit the BCF written to the chip,
falling back to the previous 1024 bytes for firmware that does not
advertise it.

Signed-off-by: Lachlan Hodges <lachlan.hodges@morsemicro.com>
---
 drivers/net/wireless/morsemicro/mm81x/core.h | 1 +
 drivers/net/wireless/morsemicro/mm81x/fw.c   | 8 ++++++--
 drivers/net/wireless/morsemicro/mm81x/fw.h   | 3 ++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/morsemicro/mm81x/core.h b/drivers/net/wireless/morsemicro/mm81x/core.h
index d46323815304..0c6e530672e2 100644
--- a/drivers/net/wireless/morsemicro/mm81x/core.h
+++ b/drivers/net/wireless/morsemicro/mm81x/core.h
@@ -312,6 +312,7 @@ struct mm81x {
 	/* Refer to @enum mm81x_bus_type */
 	u32 bus_type;
 	u32 bcf_address;
+	u32 bcf_size;
 
 	/*
 	 * Parsed from the release tag, which should be in the format
diff --git a/drivers/net/wireless/morsemicro/mm81x/fw.c b/drivers/net/wireless/morsemicro/mm81x/fw.c
index a2cb97cefc4e..2af7d302be2a 100644
--- a/drivers/net/wireless/morsemicro/mm81x/fw.c
+++ b/drivers/net/wireless/morsemicro/mm81x/fw.c
@@ -62,6 +62,9 @@ static void mm81x_fw_parse_info(struct mm81x *mors, const u8 *data, int length)
 		case MM81X_FW_INFO_TLV_BCF_ADDR:
 			mors->bcf_address = get_unaligned_le32(tlv->val);
 			break;
+		case MM81X_FW_INFO_TLV_BCF_SIZE:
+			mors->bcf_size = get_unaligned_le32(tlv->val);
+			break;
 		default:
 			break;
 		}
@@ -167,6 +170,7 @@ static int mm81x_fw_load_fw(struct mm81x *mors, const struct firmware *fw)
 		}
 	}
 
+	mors->bcf_size = BCF_DEFAULT_SIZE;
 	for (i = 0; i < ehdr.e_shnum; i++) {
 		if (mm81x_fw_get_section_header(fw->data, &ehdr, &shdr, i))
 			continue;
@@ -195,7 +199,7 @@ static int __mm81x_fw_load_bcf(struct mm81x *mors, unsigned int addr,
 
 	if (rounded > scratch_cap)
 		return -EINVAL;
-	if (rounded > BCF_DATABASE_SIZE)
+	if (rounded > mors->bcf_size)
 		return -EFBIG;
 
 	memcpy(scratch, src, src_len);
@@ -286,7 +290,7 @@ static int mm81x_fw_load_bcf(struct mm81x *mors, const struct firmware *bcf,
 		goto out_free;
 
 	reg_len_rounded = ROUND_BYTES_TO_WORD(reg_len);
-	if ((cfg_len_rounded + reg_len_rounded) > BCF_DATABASE_SIZE) {
+	if ((cfg_len_rounded + reg_len_rounded) > mors->bcf_size) {
 		ret = -EFBIG;
 		goto out_free;
 	}
diff --git a/drivers/net/wireless/morsemicro/mm81x/fw.h b/drivers/net/wireless/morsemicro/mm81x/fw.h
index b5f4c0e5f998..c5ec12da71ce 100644
--- a/drivers/net/wireless/morsemicro/mm81x/fw.h
+++ b/drivers/net/wireless/morsemicro/mm81x/fw.h
@@ -12,7 +12,7 @@
 #include "command_defs.h"
 #include "yaps_hw.h"
 
-#define BCF_DATABASE_SIZE (1024)
+#define BCF_DEFAULT_SIZE (1024)
 #define MM81X_FW_DIR "morsemicro/mm81x"
 #define MM81X_FW_EXT ".bin"
 
@@ -65,6 +65,7 @@ struct mm81x_elf32_phdr {
 
 enum mm81x_fw_info_tlv_type {
 	MM81X_FW_INFO_TLV_BCF_ADDR = 1,
+	MM81X_FW_INFO_TLV_BCF_SIZE = 3,
 };
 
 struct mm81x_fw_info_tlv {
-- 
2.43.0

