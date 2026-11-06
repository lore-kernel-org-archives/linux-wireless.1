Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999736;
	b=3zKu6z5kS4qPgmpC32A2MtGbAAEv4ddhi2ufMzKfODqkOWdqELyGdIIoD2u4su+3e32J
	 rmpJNe4GZpzzLV2GxpHEVcQ7/iMAjQqv/VFK4DhFVEPMetnwI5ntp+S8hWQZivEBFUB3T
	 ZYACbZTgaLWUOxx/prdd81GKhvOk4L++20QADXMsg9BF2KWBoBiN4WEU97LT1NSMhAGCs
	 J3YvaN5FqQHSyP312JUP88yRNCWm0sQDtlJj7PTlvjiXUXrEQINhztvBXo3meMj75WKPB
	 ysKm9XnBnNDPG1XVxmc/F4kXPHNc6u9iagwvCuVnQoIwi3a10c0o0+FgqLy1tBu7v0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bq+VtsU+O4F9SqeqecyrR8ppADV0Cns94twTt0i97r0=;
	b=vn1bL7SqHkPjp6ypJ506yo7ORiQZ6/fo6BXexHZIYy1UtNqIyXK9Qp0mctYcmsga1KxD
	 M2w4R9PPMjLS/+9qrTqMADU/Oud4SGdEB4pdZRHcrISKj7Lt3a8kUG/Fe1kOaKLthMwLP
	 5SjdRJCgtFigmmRe8iF7LAPYwflbUNNcOKPmt62mXQrIyphghHAhv3XxFjdEHHDwNjqtk
	 DB9xM//JvZ7IlyVTG7T4DDtMiX2fuRBtvmVkhcHWQJ3mArZNkVZtKoxabeI/ZW2LXbDuJ
	 uvkOxiwaRtGtVC8w4OxV89Fze/UAPTkt2WHD6Rolq9FWzpXv1ppLHWojrZG3XYXewXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O9vjhofx;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615C9606A32F
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 21:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 615C9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O9vjhofx
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a208d93758so11393755e9.3
        for <linux-wireless@vger.kernel.org>; Fri, 06 Nov 2026 13:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793999735; x=1794604535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bq+VtsU+O4F9SqeqecyrR8ppADV0Cns94twTt0i97r0=;
        b=O9vjhofxox6lfZFEbkvV38VptNibKjd8kI/hSooocuozA8ivKOkAi+9PwFp+5YEmIP
         jkpjkYx5f1FQJaHL/LqXuwM/pGnhbhx9aQ2vtaLGq3jEY182s/LuOWKskmucapS0jZjo
         tUaycnXgI5woIxrNpgoAytRxpnmjavGCbX9v93q4UGkhow4LfofLznis52/pVLUJch0P
         kq8Qhpj4dFrQUH7O+swQkyvKBmBjahT5+fK3hg2jKrVrZx4x1shXA8oYwUXP9hZ5qfFr
         l/hF1pHoqnO2PY+nfFreyGPmz384/Kj7u+qKtFzGzF2zlDUPpI6lRnemW482x7aVZv12
         djDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999735; x=1794604535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bq+VtsU+O4F9SqeqecyrR8ppADV0Cns94twTt0i97r0=;
        b=tbMJ96UzxuMxqN0TRf1EFYvmMi0uw9O1JyBfb2Hv1+01hG5jkDVFRVrrXxkA35AhEn
         a6hiJJkCZ1E3MFdR3GA5oUhHboVzdmknkAfcJOqoKATHPl4INNUi0s4zgC9L/s40lWGH
         44yupzY7UzXz3ec4+ACQ+PBMRVT3BPrU6ITZ6bFYnqf/RFkSJfXXQhrLe7XgiOR5xqW3
         33LkMNnW5Rbp4lqLenh6mJ4aiIC5Ld7+GTU3uTVlTX0VG4PnEoo2wc/f6LuHJLnUB2C9
         0oLnX3Aa80wwvZExp5zPA1GR0St6o1MaMMcHQH+XE8euHdv6ZaeuQv5lNJ8F7lsx+Et7
         pSSA==
X-Gm-Message-State: APuU4Z+9kUqESIr0KAOdMM2F5kQObgaFBFz2XjBp5d89jGXAbQFzbrhP
	LuKczLw2ZG9YJGMlKXqdyVIWJYrvVcbev1JMHX77fHhoe+WgfDNaT/90OSBjZazF
X-Gm-Gg: AYBFou2Dr1499ersCW29qi1mgkeHsB9nyGu1rVfhfbAMx6A6wLdC8N20B771lOQgxfK
	78OQMTGe7R1FWCWnfMRo2z5S3K7PmAnjOPm3vzl7kR/3SGGAhtu9R5svCJ26ijoKfvdhy/paWTH
	ij8DS2x+TRnRUbUs/kV2eWxtSXNRGCrRN4XqCq2wxxQVSyM8qtM4alitoE2pcw/S/+g+FMi/TUv
	abLmjhY0Jk60IXBtVTLx7HPdVzlleqS/zWjwLtlc4zN7AVtfpFLXeIlJb13ObIr9V70uEs5Ji/A
	4NKpQa3j3jS0R9epBnfUfoaRVKBYjxM9a+SHypCMweoEjybiISsHTyL4LXFZL3KpFVgXLTtPO0B
	F1tUVISwNB/k/4eSm/RGcCYSvTHsHY5+lDrcenCrYr7MPj/2yu4FUfsPHhru4YDZp4wlN/p6+8W
	obWw7iOv66m8B0op+FIX0uhRuhWFOOVQyY7akfSb7cKLsrgSKVF6ZETcOtxg6OwklIdJN1/J3tU
	BHwgbxRz6xbcBKNNuljkt+uJ2qidJ5B8EJoYeQjOY6Vc7G15Z0hBUXDAkB/P0ZyKFr63Cexakc1
	qr1lts+o3Ql7Rn7gref12OkajTKuYeD+qUnt1COWQAJB/pr6P+A=
X-Received: by 2002:a05:600c:c10a:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4b6e5ab6ebamr48508815e9.16.1793999734673;
        Fri, 06 Nov 2026 13:15:34 -0800 (PST)
Received: from luca-HP-ProBook-650-G1.lan ([2001:b07:6454:c33e:970a:d82:3e9:48ec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm18070765e9.3.2026.11.06.13.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:15:33 -0800 (PST)
From: Luca Casati <luk00casati@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	arend.vanspriel@broadcom.com,
	b43-dev@lists.infradead.org,
	alessio.ferri@mythread.it,
	Luca Casati <luk00casati@gmail.com>
Subject: [PATCH wireless-next v2 1/5] b43: N-PHY: fix the TX tone sample table
Date: Fri,  6 Nov 2026 22:15:12 +0100
Message-ID: <20261106211516.273791-2-luk00casati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106211516.273791-1-luk00casati@gmail.com>
References: <20261106211516.273791-1-luk00casati@gmail.com>
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

b43_nphy_load_samples() masked with (0x3FF << 10) instead of shifting
the masked I value, and b43_nphy_gen_load_samples() fed
cordic_calc_iq() a 16.16 fixed-point angle (CORDIC_FIXED() of a value
already shifted by 16) held in a u16, while the function takes whole
degrees. Together the sample table ended up all zeros, so every
calibration that plays a test tone (TX IQ/LO, RX IQ) ran without a
signal.

Compute the rotation in whole degrees as brcmsmac does and fix the
precedence.

Tested on a BCM43228 (N-PHY rev 16, radio 2057 rev 9).

mmiotraces: https://github.com/Luca00casati/b43patch/blob/755c2d8/traces/excerpts/patch1-tone-table.txt

Found and fixed with the help of an AI coding assistant (Claude Opus 5.5),
by comparing mmiotraces of b43 and wl on the same card.

Signed-off-by: Luca Casati <luk00casati@gmail.com>
---
 drivers/net/wireless/broadcom/b43/phy_n.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
index bbc30cbad..c4e6c1ac0 100644
--- a/drivers/net/wireless/broadcom/b43/phy_n.c
+++ b/drivers/net/wireless/broadcom/b43/phy_n.c
@@ -1515,7 +1515,7 @@ static int b43_nphy_load_samples(struct b43_wldev *dev,
 		b43_nphy_stay_in_carrier_search(dev, 1);
 
 	for (i = 0; i < len; i++) {
-		data[i] = (samples[i].i & 0x3FF << 10);
+		data[i] = (samples[i].i & 0x3FF) << 10;
 		data[i] |= samples[i].q & 0x3FF;
 	}
 	b43_ntab_write_bulk(dev, B43_NTAB32(17, 0), len, data);
@@ -1531,7 +1531,8 @@ static u16 b43_nphy_gen_load_samples(struct b43_wldev *dev, u32 freq, u16 max,
 					bool test)
 {
 	int i;
-	u16 bw, len, rot, angle;
+	u16 bw, len;
+	s32 rot, angle;
 	struct cordic_iq *samples;
 
 	bw = b43_is_40mhz(dev) ? 40 : 20;
@@ -1554,11 +1555,11 @@ static u16 b43_nphy_gen_load_samples(struct b43_wldev *dev, u32 freq, u16 max,
 		b43err(dev->wl, "allocation for samples generation failed\n");
 		return 0;
 	}
-	rot = (((freq * 36) / bw) << 16) / 100;
+	rot = ((freq * 36) / bw) / 100;
 	angle = 0;
 
 	for (i = 0; i < len; i++) {
-		samples[i] = cordic_calc_iq(CORDIC_FIXED(angle));
+		samples[i] = cordic_calc_iq(angle);
 		angle += rot;
 		samples[i].q = CORDIC_FLOAT(samples[i].q * max);
 		samples[i].i = CORDIC_FLOAT(samples[i].i * max);
-- 
2.43.0

