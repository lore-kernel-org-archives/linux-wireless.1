Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871170;
	b=3LHwDUVc3tUpONz4N31PhO6AN7/Udf7P8+iKFO0u/Chq7IYBYiMh6QxOxPgxEQmhFn/o
	 87xDggePpNX5wmlYw/vTOPkh87saa6hhM8QSQ6Iibun1NEVb8gJBFYLo3emnrXrfIR0lS
	 xM3UneFqcO1MEgCGGFx+mUh6jPbodZpqzvH2goS2eiZP0WiU1p2cEP0x6r0+q57u3cF3i
	 sOJvH/jHWpjuFGyCYwMN+Y601mxeJFX1k71dYdDDpSZPHv/DhdSHBChSozZWH4U6XdkP8
	 iGHfC9FyI5AaynugPpOoVpKxHCx5UUMA69ah5kq25y+h60eHtsLySFX/tV0MaGeCT0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871170;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rHLutSlyk92/tZTdye7/3Pucv9rgQaVGVJYULoTD0E4=;
	b=eSFyzSTIFMl/htW8F2Oa6r4MyKsB7Bo/jgzPXBJ/nQ8aQZvMowiNDuzLfgsmGbYMVPSO
	 7LnZcWN9cVnlkjNz0VE2aIEm5qEfP1lwwjh9djse5g86tY5n5QSWVp7uAnJATiXF80LCQ
	 oygaYyNaE9pZ+WpsgQvT2jEvaI6xMyH57bvK2SRPuYpRLyfKyEpq4h+QJ9g7as522f2Bb
	 C6pmj6YM4alnUwYgqlv6Z7c+fUwnE5V3w7iyvRQkOJYRmhj5VulWQX5fUl/+wv4316NjS
	 uIpwaNBIcmnZq+aKsMGsH37cRKTjdRaGYbqtx9D6mq0k21Xra2kk5HnN8WO2pRFgINg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731D6606A329
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 731D6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-571eb508edaso856198b6e.3
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:19:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871169; x=1795475969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rHLutSlyk92/tZTdye7/3Pucv9rgQaVGVJYULoTD0E4=;
        b=oH0grDGdXWXfb+CQkM178qxv6YSHMeCeYoj4IVaVXtQoJwqwtVMJUcZn0SWdOjEckK
         RUxvUBSm5qvtWc8dHpl2TsokBL85Wy9ehVuSjgXYII17Gy9ZwkhpODLd0Jp7tdcpAeq3
         NCUvtZ0LF6bMoNKSfwk2VWqwLHB42jn4VMmdcxmu1mniMECtwS5GT1yHk4ZIJ7R5fGjk
         432k+7CzGjbdxWKyoi5W/1cAtshR0j2m6wMRLgzQ5xEqGuTynWJKqx3D6hRedQhjHnGD
         JdzyZ7GxkLylHtBempboBz4FVnbs5SI6ogxyqt6Z4iBnvzm6otxDkJZA6dcf/d4NBSEu
         q7TA==
X-Forwarded-Encrypted: i=1; AL+hErGlxMg8byLk4bi4anvsACbKi4VIlq7B/pqBmOSfAqiyjT1MFYYa+0jtFy9H7UxP4yjw1a88gJmwsn0X5uuThA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/S7UhQDO+txvCkSfPWP6yPe6bQAqbZX07ZoZLADq5jpjoCviVd
	778UTmfJTVIrFK/BuqM4zMZRACaGsBaFglvwJFAqw+bhg3YJoM5k1UXX
X-Gm-Gg: AYBFou1d+9WAzwgM8VZSZcqXzX+1Ewm0KwjI573gVRZKkDSiOXIlJzTy5OnEbXU8gre
	MLcQLA1Z3NAOIDWoPd+GPjIo8OEM0mCiq+1E9lchKB4YPEnnzsfq6HhDnNPsVApNQgcxrSW3H6O
	RErWq7kQ+H3EtB0hl0ioAlkoGrCYBHjYpF/sV/lw9ZyydZ8qvzx+XQzBa6CVB+D6iC+vma1t+/b
	HbYV1L8LmwDjBUxS6woGnMtTKqog8aKH8s85xj9cv5xGnWnPVoBrDxUykb/A0ic329i5gF5qTk6
	XbDS7ujnSjzSwiEeWhKbnoeU+RtkfOaNvNGDEVNcG0t+QRdLNZ0WYSjCyEPmJghdLWBJSYBUcsK
	KJ9+3q+4I259z57Md4e3MPksMaDlBENj2WYZrw9Kt6wY536SDUM3RUcZeIFRp5suYiVLOyR3EQf
	x0iE+88GgjwuSoqqRjwfbw4cwccnbnl+yqjhS/PGncBTo/mdIuNKLu4OuW/kNRuiIEhn5+YPWfq
	ZkZBENxeg6NbHR1cgkUs4cORKK85XlxMpCSzOs2/OiwwXt8TItG0CyS4LEkx2HyLxLQ3TxSIaXB
	KA3jkA5PgzO6sHqXWD8XAT9DIG58HwzVwhlBmWmAYI3RyTKxMcDb+Sp2vJHL5Crz4P95W2g2Znx
	mMeo+KgdJ
X-Received: by 2002:a05:6808:23cf:b0:4f3:6c2b:5f22 with SMTP id 5614622812f47-56e63aa4882mr9024922b6e.29.1794871169424;
        Mon, 16 Nov 2026 15:19:29 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:27 -0800 (PST)
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
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 11/19] wifi: mt76: mt7925: double the retry budget for NAN unicast management
Date: Mon, 16 Nov 2026 17:16:22 -0600
Message-ID: <20261116231630.1733906-12-sean.wang@kernel.org>
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

The NAN setup handshakes are one-shot at the host: wpa_supplicant aborts
PASN on the first unacknowledged authentication frame and completes the
NDP state machine without retransmitting an unacknowledged key-install.
Right after the data path confirm both peers transmit at each other
nearly simultaneously, and with half-duplex radios one 15-retry burst
regularly dies inside the peer's own TX window (measured ~50% loss of
the key-install on an MT7925 pair, killing the NDP setup).

Double the TXD retry budget to the field maximum for NAN unicast
management so the burst outlives the cross-fire window.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 5518960e1375..9837018ba193 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -827,6 +827,19 @@ mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 
 	val = FIELD_PREP(MT_TXD3_REM_TX_COUNT, 15);
 
+	/* NAN setup handshakes are one-shot at the host: a single lost burst
+	 * kills the NDP (peers transmit at each other nearly simultaneously
+	 * after M3 and half-duplex radios miss the reply). Double the retry
+	 * budget so the burst outlives the cross-fire window.
+	 */
+	if (vif && vif->type == NL80211_IFTYPE_NAN) {
+		struct ieee80211_hdr *nan_hdr = (struct ieee80211_hdr *)skb->data;
+
+		if (ieee80211_is_mgmt(nan_hdr->frame_control) &&
+		    !is_multicast_ether_addr(nan_hdr->addr1))
+			val = FIELD_PREP(MT_TXD3_REM_TX_COUNT, 31);
+	}
+
 	if (key)
 		val |= MT_TXD3_PROTECT_FRAME;
 	if (info->flags & IEEE80211_TX_CTL_NO_ACK)
-- 
2.43.0

