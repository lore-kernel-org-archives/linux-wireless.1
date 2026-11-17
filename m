Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794875603;
	b=zmrKQqkIWkAWgJYZvSnZzTHn1rSa6aOZ6lYr2ooZcEJCajAh5L7eQ/uf6ZcOCDD4m1G5
	 JhZkhEr4Wv3m0654pd1ezIAa2zd2Ih3Aw2sWr+VcHzYewqcMmCRVApI+imtpC929iLxuA
	 5wpYyi1qbk6aNq4SiK6Ot3nFcCWb+OCa1RQ7424FHCp/LS8/vu9gOj1ZjCunLFPrtdSD9
	 cOjnF/ykyc07U3lXjgC9Qaq2PmjEwqsyjNT5b+zS74hxLA/DQLKL2QxR12uqv31hrnqda
	 C/Hi78dUgRyijJOf5KtGXCipFA9a903Xm/qBzgk0vrGTUq4S0FIgXLe8mQU2eBiaKRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794875603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NNnAsALgCl7D1RW8zxG9G0wZ5IXIckRuYCvhhwXJIq0=;
	b=2N/BNw7NlXOcXz7E+ToZXY9mNddCwYkWf1DejGuBNJQlwYhs8tV/WP50koTENHbofrUm
	 cXmdB1W5o8eVvkKn4Bhnv8N9uvVVV7+m4EcC6XJ/JK0fScZKobC+pv2Cp+EStFfYDx5+g
	 0nnWLWhyYPjZSgRqOzKflvQryzoQYtiefTBH9tj93JkIQFdHhGCVNw/fIURF+tbxlGwby
	 rSEtHcYwYwp7Iq41xap393sL3tMZ+89v+1iigy/E40Pmjsq02I3W3TIzCnm9rlFtTd9Yv
	 a0+poicOftcARlHnAnaSymZWpye3kCurQvAM6jnWjL2lqCFG7uikVCh59TAvqThb0Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y9uwHFRB;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B18606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 00:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3B18606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y9uwHFRB
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdde3597d8bso145507a12.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1794875602; x=1795480402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNnAsALgCl7D1RW8zxG9G0wZ5IXIckRuYCvhhwXJIq0=;
        b=Y9uwHFRBMfqqmvHGhGosUSF14T5Q8BfSeueVBmqKmRvgIgArnyRD6tf12upcY5fzu4
         GMqwhLay/eITSeYSli3Jx9ETxVIis9n2jm3UAVtwLxe3zZSG7NuihCFLr//Jr/X0TcGa
         HEfi/R+UcoDb7Go9na8NnwOK7wixWCxcuJA7j0EiHzuWT+Scy7Jej3LpcoMAvxqSoGBc
         NOWBUYHlO+QqwVsdfqK6UBOTQ75S7Hctk8Qh8tjTSRCkXlS3u0unQWoProP0vT9pbUBt
         3jF1GXsOh0CoAjrkk4PCSf21a3MqrGOjPIgurEB3cdpbxCkOuohO+vm/UZEyGseV+Qh5
         1R6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794875602; x=1795480402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NNnAsALgCl7D1RW8zxG9G0wZ5IXIckRuYCvhhwXJIq0=;
        b=SyO8LW9RO8CDijhCl3iVBBsvj9UsmW+PGIUDu7uiQo3ao8hyuL+3a9iYN96Decn22o
         2ORCgucTztpCMABVfqc9tqKT5/3nHt3ILg0vhpeNqbYNVHf5fIU+kG2s74ahfyOBdlnI
         M5cKIE6JDHT6VHcugqoPEmJ62vPgnM8d2FxucqaF9k77XlbASnXtwEm66XysrDqbQULw
         HjsqIPRGQ+z3KLUAEzOhwe/OYFYE2CGCsiCn1StzWIFrqpcCV7s3gbz4bsqAOWV/vlLQ
         kkutJ6Pd2FWTlRWuQaNo7N5CkV/SdqxMKcUrrumqauc7Hy+O156Gs134mQC/FEXkujeD
         aR2Q==
X-Forwarded-Encrypted: i=1; AL+hErEMerOlL5FHnAQzOMZrIwhNTp3YY/yZo0bKeOdnqpbv14PqePYOLmdbzekTAFImx92bl0Y4WnqhJMgvQWiUOw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8i69IDllINb3a6iYRqi39+/I+A1NhVVi2rQEyxQ+mDYaGNTzGC
	W9ExR2xuPwYTkjbNGnOR+mRHukgtddjpEurVPxpJlKJFkw0Kalz9wiJrAFN+rS/srLK/5m2vSHC
	wq9Hp
X-Gm-Gg: AZFdTZch8wwy0BUtaKRPIA+HvJQsK0KWH3ENcMpkkf9wVYFxo+hrlCdNzWnTfDd8Mhg
	n+TuedfjgSV0QC7Iki1wWQq+dDd94dMwYy5N27JEvBzKbQeiA/yOXdZ3duhGuOBJsZAa/wHZGGd
	hY5N0S9pdeSQXhhSkdnYxum1AMKmYe9nF4WnepmxyaY5Cr0QnpLWgI3CkNdbIUKgDFfe6py0Fgn
	jXOrlxn4ihds6gMLxqv/21b4v1dRzjItcthQzY/5uKtJRtSk8NnWzjYyTqKknKEIvYt7G00leyW
	R4/v6VBtgHqihFQo3URB+fvlsPQV8PintCFbovgS/EzRkSIz2UFiL3NeJQW/VsuMlFTJWLMZP7C
	TyV5HMOnVKpEqF9hz+6EXPfbDQlWgrBbdYwRS6HGaS3cHduOOMKUwdHrgUDz7DR6AGG3aoDW2ut
	pBuV7rUemn01eeqdFRawGPIe4GFpUMutpCfLfBKgw3mUS/R2dQSJ0U3HEf/poJS/DF70erVnqUy
	Jv5S73KU7p+wC0eY4ihNdII5R6MxS5YAm8cduKD7s5ZO7E7mJ6kut/Tp6Yx+EokxlGC0SgKFA2n
	1KKm5vhGm7R7b3dsXCw+HdR6A5tXfPc3nmx4kPz4YCdQ+/i/WxKXVJaEEndNTPn1iZpEnSaPq5p
	uFwi4t3RAL5/JHBcJ+7ds+KYWazwyeKEQw7aghhzWxjoyRfc=
X-Received: by 2002:a17:90b:1dc8:b0:3ad:7f4d:2839 with SMTP id 98e67ed59e1d1-3b3abb361bbmr515066a91.14.1794875602090;
        Mon, 16 Nov 2026 16:33:22 -0800 (PST)
Received: from mma-H9MHD44.sydney.mm.lcl (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac6016c3sm1214868a91.15.2026.11.16.16.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:33:21 -0800 (PST)
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: lachlan.hodges@morsemicro.com,
	dan.callaghan@morsemicro.com
Cc: arien.judge@morsemicro.com,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless-next 2/4] wifi: mm81x: use the BCF size advertised by the firmware
Date: Tue, 17 Nov 2026 11:33:08 +1100
Message-ID: <20261117003310.1032097-3-lachlan.hodges@morsemicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117003310.1032097-1-lachlan.hodges@morsemicro.com>
References: <20261117003310.1032097-1-lachlan.hodges@morsemicro.com>
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

