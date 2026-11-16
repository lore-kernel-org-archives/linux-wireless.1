Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871212;
	b=XsjD8pfhWVSK8TfC73KLbgczAQKAmKCNNi4qKbuaS6vma98Fp5fX5hkFlqqHS1kL/EuP
	 2wCAb7luU+0EdQDa2WNaagP3OiXUVpL+Fi8wjj9ShZIIEO+r3xQrGO1lmTzgQb3eUW7sH
	 ooKtXK5gYzR+r3dTEPr9glm/PrfEoUw3uof9YQswUmNZlHNSh6Qp6ZIm1Bz8q5RjHmsb2
	 7P2FupVCkVwQQqulFYtQE7qe4Z53E9TpVcjQnsHpV/f13asBP/QImhvPdrxhbdoYsEX1l
	 GLjLt+719c5xX/sZ7eiaHkefXMjJHKWETrfjxShZhJRyKB0imzxeleVeu7SYzfmzFww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871212;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jxTFYSlQWSzScSRa0EOOLNZyxPVKE9gzJQ4c1bYS5kc=;
	b=BXygSh/7MsjkyRXrunvty9vF6jNE4Cc50Rw34cpMQDwZThlCImRVnPDIIemqWNg19BRh
	 h6qJKwbSINugGB6JHWrjZbvjJF1YGk/GRGHVum1MXeTNP2iBIrDxKPNceUkezrbe7D/L2
	 uGrxMttctUKEiWFb1slFmuzSsFv79+KrjHCwqO5VwhmoDFA04IlWoSPQeeSXIlB6z0nBJ
	 m4Y0NsGK9LXtqcoqm/PgGSV6I8rgYqWeJbTHOfnKr4CISsStzp1sbu84Llw2iR8EiBYAX
	 ogXE78hp07N+1gBgrV3dFaKq8u7avqZ6wpe9Jw1zdC8hnny9v7IGs50kVbcryME3tzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCEB606A334
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FCEB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-49429181ce9so3076771fac.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871210; x=1795476010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jxTFYSlQWSzScSRa0EOOLNZyxPVKE9gzJQ4c1bYS5kc=;
        b=cWscIDVfyB0d+Qyj729r9BW0Hl/W5FaR5FJHd0tcHzE7hUIWBMmYe7o01sXYbj7LLE
         cNCAqqkjjAEgwc5Yh7x4hOric+O/bdgIvryT3z//XuvSWup9ZqcxTCJDOkEu287qPopl
         qxpYngJEnYztcZDumMwk/B99LZV3+O17AKl4IPRaViY4R6A5+5azVDoTHohJya1/R+k9
         ++oCF+Ia6no6rm/AYoHhCO1hRLhJAvzz7AOZOpV1dfnjoHNjywcdcNkdUA3IJFecqWFn
         VZO8SK+L9ij8hBQFUpY1pFT390PYFQ0w7PxkARsxXueKLM2qgrdUgwGdn9Xea0BxwQ9b
         yiow==
X-Forwarded-Encrypted: i=1; AL+hErGk7wSEfOw8QuNYbzmx/zLfga9LXdbvtSNsyvEIJ96UxeBJRGlySeb3GlKT4Dkfm8m1FnvFFNpeZwkflWn98A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+mQNHaT21F2ESjd4wy5OMeg7xBFS/SejWGEL2HY3OzieP0sc3z
	73uHsvcIfXdIlG2Eg0ENM9X9IZyiizH4fWZPmiZdEmg0WS7a6rVJAud8d0o/FA==
X-Gm-Gg: AYBFou1x5CXXB0S1ZFLgcXc8GUUu2gztyB93fTLHkRKm+ZQpJ1WOv8WSovkiHrqNVkc
	azEhaRPPrJ0d3FyKWXPZ6uGHWlcWYYR4KfZfmoBbCVGbkpz0cb9pme7Ru6/xozP4PUnio6Hf6rc
	4lHx5dZ8Cmcav1RvhXlrZoqt/1LUFk20xi3YrZwpGGBmmCbuUTCFDRJ5JazxvhZLj8Jf+fvjTmm
	yq0s71hrxojMfBi5bCsrLL9zLPDOi5iO++c++M//D20o8QdaVPJ0Zmtpg3bfp+FsT1goYSthk/F
	dacmiRFSVAwsl4FAGc6Ene7SMOUd3zBk64TLoCOyH30Y5juyl5GgI2aAGSAvIWiKCFsOeBP5gKn
	qX7f8d+VfH/mhd+1mbAG1T81DEYNVA+mQ1sHNIwCa/KU3jj5Meb7sAVkjjqSEUuRFoxFzTbSmNr
	3AC0Ih6vfihfoNTBKEaQ4KShnBXchqIVoiluqMjvjlmt8XRX73AsVj5lp7/oySDaVjBxiTgKGYl
	gm82TnMw3o8ZQ3K4dzGcCnvXe29rrsev6DVeUh4xqhHp54FGmXAN1qlwLiT+hcejgIeoZr/tEET
	TEW1ab5z9qylbuKPei0IcegNtHXai/Vgy78PKY2lnnEZggo5ytyQ6JTk8MsBvW9MrZXF20mXNYL
	yRE02EWcy7bPFXpN6N0l1BUkRTib5Gtw=
X-Received: by 2002:a05:6808:179b:b0:4f5:eaac:5173 with SMTP id 5614622812f47-56e65a3cc9bmr8757530b6e.57.1794871210517;
        Mon, 16 Nov 2026 15:20:10 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:20:09 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andrzej Ostruszka <andrzejo@google.com>
Subject: [PATCH v2 19/19] wifi: mt76: mt792x: allow three channels in the NAN combination
Date: Mon, 16 Nov 2026 17:16:30 -0600
Message-ID: <20261116231630.1733906-20-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
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

From: Jacobs Wu <jacobs.wu@mediatek.com>

A NAN data path schedule can use two channels, e.g. channel 6 on
2.4 GHz and channel 149 on 5 GHz, while a station interface is
connected on a third channel. The station + NAN combination only
allows two different channels, so:

- if the station is connected first, wpa_supplicant, which takes the
  number of NAN schedule channels from this limit, rejects the NAN
  schedule and no NDP can be set up:

    NAN: No unused radio frequency available for freq 5745

- if NAN is started first, mac80211 evacuates one of the NAN channels
  when the station connects.

The firmware time-shares the three channels, so allow three different
channels in this combination.

Fixes: 420e0bbd52ab ("wifi: mt76: mt792x: advertise NAN data support")
Suggested-by: Andrzej Ostruszka <andrzejo@google.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 472333ac1a62..a835c8d89618 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -118,7 +118,7 @@ static const struct ieee80211_iface_combination if_comb_chanctx_nan[] = {
 		.limits = if_limits_nan_mcc,
 		.n_limits = ARRAY_SIZE(if_limits_nan_mcc),
 		.max_interfaces = MT792x_MAX_INTERFACES,
-		.num_different_channels = 2,
+		.num_different_channels = 3,
 		.beacon_int_infra_match = false,
 	},
 	{
-- 
2.43.0

