Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794763771;
	b=aZ8e9aeF4LKEeBTmHW2H7/0IgpwQeQZqgcLhSiypIXT0VM6nNtfHN6tg291BfM21IQzh
	 3EXWZ1kqdYEQFRPPiQxfE3UQUpPRCkfyD+GKNUYq1H9aALvFwlbssBKc6D6PYzaFo6ZUk
	 pjeM0UyDvLXKjy47NR8IQF0OeyeqMFFlFSUUU72z4KN3nSeLcVzoZFFoUVbEJRDFSui3v
	 zM8VHW1U6GlmYXYTY/8YSQsah/sG0i3+8W0qRbiUFVoLbUfkqCSugyu5+K6dApIkl9bU0
	 McIzDgnJjurXJWNaSgy3RDCGztFZkeqdz3y9fvQsP+PFLyT/mcH5XL9Gt/oKogS8o3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794763771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jvMlJhDXY1LlyG4gb02Ic1MIpoYztJSwDH532cBBfm0=;
	b=VQisltmwwhdRWV/vSOfyN+VLtJGKX4ECH5o1RICwVBmfexsh02Uq23P4596Fsunf0l9W
	 Z4nxERsfKWNIq4EUO2HUKKdJPjrD43b55dFebDgmmKVAtvxvYdgbKTvFwnibpIbEZCCB1
	 jgBeivznCFkQYSV49lTWZ+506urBOFSV4fII2sauikedlObQ1SRgdX6BtRqdigVh8eBev
	 /KkeX/9uDqm1jkrP7LcmaIumpKTWBknYgEQoKc4kKyqSafF4Bi7k5+ZGPnjJ/S32im20L
	 Cz4bsE8SExThqdgMZShwiWCTQiE+pVHYC7yr1Yg6V8tIhPu55hWPabqID/b4GdKX1gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ppQiZeoh;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB588606A31A
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 17:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB588606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ppQiZeoh
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3acec6677so3526960c88.1
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 09:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794763770; x=1795368570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvMlJhDXY1LlyG4gb02Ic1MIpoYztJSwDH532cBBfm0=;
        b=ppQiZeoh0FVdpP9Xa16prSfNu4WSWlx0pUU7ZTLLdekdoDM5MR9lSrn149hnYlv0Cl
         4IHqfGMh1kMpLXX7FLL0zgIfJBsjmzdJAJqrlnCcirq3JuzwiaMVCRay/9UexxUsHuaI
         nt4/0wdpv/159NkuQI21t8FxWblMHWUhMA7F2QmyHow7YupO0nNzfB4KUkb/1FVEYFmo
         Llys6INOmxBlPq8m1w9aCOKs3TNk9e+eAc+H5BY/+bW7vcPwoj60RVrUgl0mgku6HmXH
         WZpwaIrDFB1ljuG1B+2QIplym/fASICwbOIcHvkEAFuafTXTDwgsJpo03UDKeFt/UjFd
         kdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794763770; x=1795368570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvMlJhDXY1LlyG4gb02Ic1MIpoYztJSwDH532cBBfm0=;
        b=v82/wHusozXmIUh1V9w6Hck6iYwoHMpPx90eJNeEvdQjG8+g5abADidAbFEAjvfy3j
         Br1mgv+8OxlX3InutLutExsF+VXZujGWzjYiTk54ni9YcxxvKkdqPG7l5Sw0jPu0H4Us
         jb4JOf/dVBwAHeQxZobjXxEchP20bgpA+cXs91ByxhkDSyQdejOXkq4JqkCxdsf6mBCb
         G8dDjEqzE4u4dvWYFCX+5bq1lubWn8TOKRc8PCMKRpr3xh2phUNPpsOSX0HdrUWVxc5W
         b3khWZx74a84TUEogBl9R5fJvwTUmFXgLgXFSwbvT8AYAZF6Zwz8VDS6Yonuzn0oJb2/
         zt/A==
X-Forwarded-Encrypted: i=1; AL+hErEe0n6Fy+Nh3G9RDxXH4w0tqfwYOAu+l8nUfNy5q898sPv68Ht+1Us3wJr206ryg4X5aQI68aTwBAcVKKkZ0A==@vger.kernel.org
X-Gm-Message-State: APuU4Z98uH//dQ/8IfKe9mUOSfCMPdm5qg3HzXrFNEEbEQ1KvilrtRFd
	PcbuwUfDogX1eVSRv+9DRhKRh3JJQXT0vJIztSGnPTNmfMT2lT4nUJ+E
X-Gm-Gg: AYBFou0cpdAT0oKaKQfAM847dLCJegBx1yLjCKZD4FYiCASqw6MFbVP4RU8u9bOj/tN
	S+sMNiBDJQMF+bJ3tmMOUDYDDUFuhyRYsCd04JNioUCHVBQ3Ca7kOq8gI6nuAyyhCoC+jeD63B3
	hDLH3/2tSuV7Mkl2WR4uKd6jNzCyA3Yef2fytzCWnTsK1PUlrUj3Nxc/t2IXZugXhfWQGcGYkCl
	/m2+j3bPBQ/UWXlmlR1Vezk7ea7oTOvyprlqEwPnP6mW5+HBz5s8IL3HUE7EEb5pISNQZevDIPR
	dewGKxskrBzhLT2ZSzJWrRsHwTUmcALrENEV5o1enZ/U4Pyuxp3xbS3lTLVKYf6vvydrfkZXHf5
	Ru4m3He3cbnoZO/TOpEvEb1kiGqLlXMJ9PjLkDhifuxJD/n3LmgFYY5jMgoFFz3XU97pAdlXgvd
	P4/rMsb407CJS9pmnxGeutWps3J1TlwpO+LovQ1uH1pnVGNq+OwZD1xnQQOHj12tpIXgqSBLjHX
	ilkZ0Hzw4dQp1+Fhkevz9+reRdASGl5lzBohPXTo/xWUjOSyBJQxrKTBlDz6e0c5r/Bx3cvbubr
	YP1FzYSVSBWq7MNAqEUxB6dwKSqzRqRsQfUvYG7QPoBAPUjk1Eyl2Ngg7GjB
X-Received: by 2002:a05:701b:208d:b0:136:c443:80e5 with SMTP id a92af1059eb24-1b5030555a6mr7011216c88.6.1794763769666;
        Sun, 15 Nov 2026 09:29:29 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:d1be:2710:af83:9beb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm21618268c88.1.2026.11.15.09.29.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:29:29 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Po-Hao Huang <phhuang@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: rtw89: update PN state only from correctly decrypted frames
Date: Mon, 16 Nov 2026 01:27:54 +0800
Message-ID: <20261115172754.35124-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

rtw89_core_skb_pn_valid() records the sequence and packet numbers of
hardware-decrypted QoS data frames so that it can drop frames whose
sequence number goes backwards while the PN advances. It runs before
mac80211 discards frames with an ICV/MIC or FCS error and requires only
hw_dec, so a frame that failed decryption still updates last_sn and
last_pn. Such a frame need not come from the peer. One with an advanced
sequence number and a PN between the recorded PN and the peer's next
one makes the check drop the peer's following valid frames until their
sequence numbers catch up.

Skip frames that rtw89_core_update_rx_status() does not report to
mac80211 as decrypted, or reports with an FCS error.

Found by code review and not reproduced; compile-tested only.

AI assistance was used.

Fixes: bda294ed0ed0 ("wifi: rtw89: Drop malformed AMPDU frames with abnormal PN")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
 drivers/net/wireless/realtek/rtw89/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 58ee5efc3b5e..a173253d51ff 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -3950,7 +3950,8 @@ static bool rtw89_core_skb_pn_valid(struct rtw89_dev *rtwdev,
 	if (!ieee80211_is_data_qos(hdr->frame_control))
 		return true;
 
-	if (!desc_info->hw_dec || !desc_info->addr1_match)
+	if (!desc_info->hw_dec || desc_info->sw_dec || desc_info->icv_err ||
+	    desc_info->crc32_err || !desc_info->addr1_match)
 		return true;
 
 	guard(rcu)();

base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
-- 
2.56.1

