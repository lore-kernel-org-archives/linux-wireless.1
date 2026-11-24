Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554432;
	b=CNom1wouScaRq8JGKLv1eKDT7amb2TYPLdhZ+iO7Zn2Jqe+27x8/T7ZYFOmY41P4rCo7
	 yMIPJsWsRoD+wn8xVIEh5Vd7MKzFtB78WgexVXI0itxilp/k11ngy6OMkIYZdVKn6bLri
	 NvxDJmD+dbkBqCyTGVoAQZxyQVO2fiwwai0kECO8fgEkg9LCih06cAuiPiAvAk9SxeoxH
	 T0VdeLtT7BkHBW0PpbZTM4obOy5Yw6QT30GvIIfympN91wxb3/50EKFSabZGtkRjOgmtT
	 ZY98WLwfqkHVLOXZKuXrkT42URqtI/YnOrZP2/oxl+bxZpJqMWw0SdSaDCjNRWEagXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JInzWrdR95K0ZD2w0DNtIwvg4U0S5n5bYRBjEebUBec=;
	b=q3Cf5Sp5sViLXiSIrcDktIni+1MIjKveMr2QQ8wjlP8apiMLRFOK58YmdcxIHAR3sNT7
	 owjsDfvDrCs7+btsJVVG56qBG0gJXDhxONGPQ9HaJMJjZlLlvZhl4672XJDrbkYOLiQBA
	 Hd+3k88mXJDTQwltmIQ9V40/bBWs+UFACtqIJxkLeKe9pnDUzwswKuIrCu1WIEUS32q1u
	 IuquCEmRfms8q9hU5o6+WcZEtE974Po3YNYptMwQDmepQotg8aAYNV1yanQgruuVISrw2
	 /bzUovxzTciCR/mXAmGzBnEUDcimcfsyR68YaneGW8y/GQxxw3ctHaF6I5fS6un+3/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWHjpanv;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8D6606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 21:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F8D6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWHjpanv
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so2750485f8f.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 13:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795554430; x=1796159230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JInzWrdR95K0ZD2w0DNtIwvg4U0S5n5bYRBjEebUBec=;
        b=uWHjpanvqc/mTWJdw+g4Yybt0opescilBObMqIrYUps17Uu7aDh5XrT4n5PV98YcNH
         J5c5c6FuYscirjbNE64jRUtzR14AnPlenEVkZZ2F6uioeoArxFsg5Nh1ExJdzcQrcPBt
         BrMbl+XNomWilTo/7OHQD7f6bucYLb1Tl2vFaxKBrRibacSEmFKV+JX3UPKgHZfbeS1R
         kVF9lE9Zn0C1kyfHi8f7WV7hFbTfDS8QDaryt10I8hSNJ3qre6LJwMgq341AYbPA6Kri
         eOE216qEsyZb/qOIwKzgC9LkRbMdVS+xTK3rE3u1eIcnIchNvK7KyCGH4CS6ZxM35p5f
         cWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554430; x=1796159230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JInzWrdR95K0ZD2w0DNtIwvg4U0S5n5bYRBjEebUBec=;
        b=SfD0Oz1uBO3ivB/wb7cSvry6K96kFL88T9ejMR9eUo2pxtSWUjhcpf2mmPvB2O2Zi1
         3xnJpmghffzGTLRCPZwo/jD2QCWwlrF2oGQE7i2AkvAS1+vHkZNJABBgRQN46+IhasvV
         aTNS/dFWLBb9MlMSf7qGjpCz2Nz2SJesc1b5uikBENtspSIICDJulfcSBLqXZTm8xoe4
         hkdaM6clo+jyGmks2fh4uzHg+FmjaEzdYwYHGrgOf9/AAscU2hsVojA+UN25inigQpUs
         T22ype4odFmdYWP8bZoMMYpsA3/JbEcU6HePXr+N3sHBfE9kXN/apvZQKY4sl6OLisLG
         PLWg==
X-Forwarded-Encrypted: i=1; AL+hErECs81WD5Mp9YFX8mOavXwtKnFmaWUamqlggOMl61hKShFeQZ0MvfSGAA+Q6HCikLYIg6/aNKmB9zwrz4vj+g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/KP217b0c5sdGQKwd/HL1a3GywuQrPMIQ/BkBLIG5+ILlZNf27
	dMwZspdU1OPrQRtK4URYHSnWnrBkH1wWLQamITqL9Y+euXeYbqmxEOU=
X-Gm-Gg: AZFdTZeOQfSBbr7I/B1WaBKepNlgK6zeZj2KBBql9JE0gCa/LZ69kVo2BFlZrnYT9Fj
	RysQuaCE68w5vpazH8FuKRdIvIDySR3vkZJhupHbHnHXMmSSQtySbHiofU+9dWB4+jnEQV3F7Hi
	idjSwvSsswJBPT7wXoXYMZ2YMeq8zobVdYra1F9MRedoGoDViOW8Iq8huICdtRF9l4Yc92N9htS
	Ui8UDnSLPwty/ogi7yduYzBgWtzaSJyRDRez/sSjLwusN3g7W9+giYxap5HPc79vBDX/FoMkaT+
	M+HGh5tRoDS8W47zcd6DxudoNEgxYq75qjyuzsVk3p0R7FhXyvnD3rZv5SAFsiY84wr4XArgIKW
	/EjSC/9vY5BXrPP3iacPxr6nX2+LoMk7+7VDpMsode4OdYKkT5+euaLmvG6bvgIHibpzGfmHX8D
	YoUUeiGXnIfrwLUwIwCsxgupRLUqR3i4qDCZVFJUQWm1vcFiZBDry13fho4QvP1r4/JuZp2DgZE
	fP171Nbmq2FbxvxsvPzH59n6JTphs1hjV4f1Jh8hs3zSb7ahw2FiaoZAXnvpiGXFGV3OOkVzr5F
	AkqiDAlB3p7skusRB6hE7QR0f7dWSIFtNT1oeQ==
X-Received: by 2002:a05:6000:258a:b0:4a6:4f35:1bdb with SMTP id ffacd0b85a97d-4abb44d3448mr31982884f8f.39.1795554430199;
        Tue, 24 Nov 2026 13:07:10 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm27085045f8f.17.2026.11.24.13.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:07:09 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Jeff Chen <jeff.chen_1@nxp.com>,
	Bing Zhao <bzhao@marvell.com>,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 wireless] wifi: mwifiex: zero-pad SDIO TX buffer to block-aligned transfer length
Date: Tue, 24 Nov 2026 21:07:01 +0000
Message-ID: <20261124210701.467325-1-tristmd@gmail.com>
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

mwifiex_sdio_host_to_card() rounds up the packet length to
MWIFIEX_SDIO_BLOCK_SIZE (256 bytes) for SDIO block-mode transfers.
When the original skb data is shorter than the rounded-up length, the
SDIO controller reads past the valid payload into uninitialized skb
tailroom, transmitting stale data to the wireless device firmware.

Zero the padding bytes starting at skb_tail_pointer() without
extending skb->len, so that reused buffers such as adapter->sleep_cfm
keep their original length across sends. When tailroom is smaller than
the padding, zero whatever is available.

Fixes: 5e6e3a92b9a4 ("wireless: mwifiex: initial commit for Marvell mwifiex driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
v2: use memset(skb_tail_pointer()) instead of skb_put_zero() to avoid
permanently extending skb->len on reused buffers like sleep_cfm. Use
min_t() to zero whatever tailroom is available when it is smaller than
the padding. (Jeff Chen)

Build tested: x86_64 defconfig + CONFIG_MWIFIEX=m + CONFIG_MWIFIEX_SDIO=m,
gcc 14.2, W=1, 0 warnings.

 drivers/net/wireless/marvell/mwifiex/sdio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/sdio.c b/drivers/net/wireless/marvell/mwifiex/sdio.c
index 417dc2649b99c..d097efb2afbee 100644
--- a/drivers/net/wireless/marvell/mwifiex/sdio.c
+++ b/drivers/net/wireless/marvell/mwifiex/sdio.c
@@ -2386,6 +2386,11 @@ static int mwifiex_sdio_host_to_card(struct mwifiex_adapter *adapter,
 	/* Transfer data to card */
 	pkt_len = buf_block_len * blk_size;
 
+	if (pkt_len > skb->len)
+		memset(skb_tail_pointer(skb), 0,
+		       min_t(unsigned int, pkt_len - skb->len,
+			     skb_tailroom(skb)));
+
 	if (tx_param)
 		ret = mwifiex_host_to_card_mp_aggr(adapter, payload, pkt_len,
 						   port, tx_param->next_pkt_len
-- 
2.47.3

