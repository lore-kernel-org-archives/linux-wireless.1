Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728267;
	b=TLPwUbvKb2BiNOCcToOYljlRXGpXujPYq+6JNHJzcadgwf9BVFV6c4gO7aGqq1GBkbu4
	 v8XF79u0VWaKcqUnMMtKK5MHFXk0E975EhGKNbPtK9Nm/ddFS187d0fAh3C8AmL7wqBNF
	 s88QYt8us5jJCtX3dZMhz4K4Sm9ccHy9btVAEta9FB1vMNgc3Ad/knuxZ0qcZs4kEQoj4
	 XTL1EBZjjO4eMxLduLTYICWCstudwa09PM9mQbgj8LYa5vb34pV3bYKb9B79rVvv+KNqg
	 qlKHFaHk4zxhYpRHyKVzYESBlmUFAAGjyCr1c4lIUrHAxuunKQ63QQ8vX2ZzPFSmp4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NdR/Ydz/Y2I2j1/kAa1A/J/L0/r1xq3ZJbNsLr+3loM=;
	b=J5kBkJ5zE1jF1xC1lSR3OazdHVo4cGXKkSs4WRM8a/na35b3T60oOZYGXD7axsy8dRLU
	 8IKFJdbw4bU9QN4DSyr48wEY524aThtXbhRkfPlt0ezu4yJ+fEE6q47lZP+TOxFLbFb2s
	 yz5Xb9S5fPzWBy6eChvaR5sLRfNhEMLYyJReyse+k4EZNDl8Yiqges/+dYEunGMB7uSu0
	 OCx8PTejeUb+LNsgr8xCvK0T8miSDQt5WUwl+0J/YpeO0DC+XqdqNl90hxcsHZ3RrYW5G
	 LmqwpFFlBeq0zbk8zmtNMO32PMLpY60j23cT+Trr//v0JuqHgP434rkvR4nEVTDGh5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LM7c3oAQ;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0C6606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 21:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F0C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LM7c3oAQ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso53571355e9.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 13:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795728266; x=1796333066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NdR/Ydz/Y2I2j1/kAa1A/J/L0/r1xq3ZJbNsLr+3loM=;
        b=LM7c3oAQZ01gabD7Gm8C8Afdd3EEMosgzw90KWsk7y4vHp2L2CePldAe9Tll+d/n4J
         5/GI02ux61JBPLMBQmvY0oFuUkJyUqq0FDn5W7BtmevI9t+OZYDCqWSHoHtWAu0+7D3w
         RgmJMCqLXmmzsiUU/aGSjX2KQPr62b3LVXvODnlUbhQnU8VTjarJ/0P0VY11R2Z8Vjuu
         80WhyjbRh8/8ymwFIaAVnHJ2EHfK1u3yPVEla1s2zz2zO9vxK0ImatP2POMRxDTILKrO
         dwPJ7bG+hyOcFVIpZdqYcJ1aREZxHzgqCXCbWU0t6c1uFzoqVZoRG2SiCuUUVXkFkxEd
         r+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728266; x=1796333066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdR/Ydz/Y2I2j1/kAa1A/J/L0/r1xq3ZJbNsLr+3loM=;
        b=ZcaiZK3UifX/lcZ4iSqq3djtv38tcilVDfqeQgmKpGPAHVKatVTyGI955qMdkGxigT
         W/tkdcYG6GlxIPXaj2JEtXSKzDdB7jT9AQQyRVMJu/j9wd1AeCEblx/MdnflNb53VqCi
         fz4xI/LvrCUGBOuUcwooYHVWsdRfm0W6AH8pAW3uoacA4n057P0ERyO51AtY9mM0why/
         6hd3kAxMCKNuel/NCbRBGFZfLLz9TUxFsGrhhfmdrFjZlNZtUf4CS2nAusD5RQ2w9fCO
         RoksPoVMyY+KOLIV6/ZzgVVc8UTzYYWLGpHxPjSXxC56lR6qfUh9AEYUNfsswvVFTTuH
         6W4A==
X-Forwarded-Encrypted: i=1; AL+hErF2Hahy0X+4LhcInGmHbFDNskWvtvMGfRoRZUzvgifFsLpvMLylIRk2gsKtLqHnm/w60fRnuCMoIzFF0dbcbQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8fqdx2DIKYr6T2vxyf2ICD415eKC/ZKDkHYUiAgs6k4lGCQoFH
	vqyesWmfPN3cIYHotTzVp5lY+R8r9Za+CQl/cz/aesPbTRuqz/iU5Pg=
X-Gm-Gg: AZFdTZcPZdsEb/V1plcvErrWSda2ByHu5O4KV0vm2+DYQXNOvbPbZLa1wfPLbNSM8Px
	tP+XvB05PFGy2uxPj+4EhgJpMXb5pIkTh4mKRuWAStnZmAurV7M2uoxfElwlhLTkEmxcoZ3sKbR
	UlKNPBp5RHIZCsX9NGzXCEcMznyaBMQzUq5Grxtiu1G1elz0c9KgvDtBDK44rGnnzdtb9gYtMWY
	P6MffAPjiw1LhEKbDZYQIi2QkRgvo/EFURikWRzgJ/KMlRKPMZlPEdn+7DulUrt9RhzAOC3Ai5n
	ohAz+1xcv0AlV6sohP0jz+cqPKmdNPGZTQ20S0Vq3wzUlox0W0CIKIg7sYJBIG3iCo7JUfAkM5S
	xucSe4RDadnOqA1y0cUWPJ7/euwpVnLLzYtQ66DBWD0860bOyRCj4aU0GBKHqJZo9DQ60GxOEKL
	X4w2QVb9/CeDUgGHqj1zidPKHz8JmdDYk7Mq4S5VUCU1ASBnNwUZz7loNgkRjP/HxjTSDsd97Yq
	7fpMQaPm+sNP/OcDFN+hga9L58Qsa4Z0F99KvrrXlpoyvKbRZ75wVXe4e7Dudrk4x0Ke/8x2hd/
	+0Vpe82s7xfszLED
X-Received: by 2002:a05:600d:6510:10b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb8881de57mr309135775e9.26.1795728265576;
        Thu, 26 Nov 2026 13:24:25 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm612522675e9.15.2026.11.26.13.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:24:25 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Franky Lin <frankyl@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH wireless v3] wifi: brcmfmac: zero-pad SDIO write buffer to 4-byte boundary
Date: Thu, 26 Nov 2026 21:24:16 +0000
Message-ID: <20261126212416.1397643-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

brcmf_sdiod_skbuff_write() rounds skb->len up to the next 4-byte
boundary and passes the larger size to sdio_memcpy_toio().  The 1-3
padding bytes beyond skb->data + skb->len are sent to the wireless
device uninitialized.

The SDPCM header carries the original (unpadded) frame length, so the
device discards the padding.  The window is therefore limited to the
local SDIO bus.

Ensure sufficient tailroom exists for the alignment padding before
zeroing it.  If the skb tailroom is too short, expand the head to
make room.

Fixes: 78b3f1c5be8f ("brcmfmac: replace brcmf_sdioh_request_buffer with brcmf_sdio_buffrw")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v3:
- Check skb_tailroom() before zeroing the padding; if the skb
  tailroom is too short, call pskb_expand_head() to make room
  (Arend van Spriel)
- Use the correct Fixes tag: the 4-byte rounding was introduced
  by 78b3f1c5be8f, not by the later function split (Arend van Spriel)
- Add impact note: SDPCM header carries unpadded length, so device
  discards the extra bytes and the window is local SDIO bus only
  (Arend van Spriel)

Supersedes: f935e48bd9a6 ("wifi: brcmfmac: zero-pad SDIO write to
4-byte boundary")

Changes in v2:
- Original submission as part of [PATCH wireless 1/2] series
 .../net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
index 71c2f99cdb711..e5068da9672cc 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
@@ -317,12 +317,23 @@ static int brcmf_sdiod_skbuff_write(struct brcmf_sdio_dev *sdiodev,
 				    struct sk_buff *skb)
 {
 	unsigned int req_sz;
+	unsigned int pad;
 	int err;
 
 	/* Single skb use the standard mmc interface */
 	req_sz = skb->len + 3;
 	req_sz &= (uint)~3;
 
+	pad = req_sz - skb->len;
+	if (pad > 0) {
+		if (skb_tailroom(skb) < pad) {
+			err = pskb_expand_head(skb, 0, pad, GFP_ATOMIC);
+			if (err)
+				return err;
+		}
+		memset(skb->data + skb->len, 0, pad);
+	}
+
 	err = sdio_memcpy_toio(func, addr, ((u8 *)(skb->data)), req_sz);
 
 	if (err == -ENOMEDIUM)
-- 
2.47.3

