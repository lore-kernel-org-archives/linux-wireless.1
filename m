Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795360094;
	b=IXmmWjOT1ShLrSPnqknoOlc+4L4ig/9IjINi8+Nf762+pzCrJdVQfpL6W6RJElMB3Jo3
	 zuj2rjZPs4ZX3gnrJB32kft2tklnYK+ufUING1iI4utZevySsZU29ScPo/cfYO2gZpyyX
	 BYOPSa9auI9GygJGuCgpuDEQdQX25rRtTjSI9ofnxy0fAHFHMN7JzvzihDUcwkddvClQf
	 gtTXQxCJeC2YRat4qsoC4BPAhwvnONFBn/rxZCSkFQhcEGi6TA5bsrjvowSkfRwKlQE4Z
	 GK0eMgU0QwVVDE/S2X9B6t0CJDFLi8ekkxouEMQzqRorkBAXR0vHCoRJewoQWdvwTCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z5aYDtbjooX6OdgNuNX1vYLxnENxkXdoT7fGCkr+rps=;
	b=hUVN0lelId8yoor76QqeW7+vwiQT+AfNm2M8QxSot9FL4/YDlJCYPEAmYcDU+9BK7kgS
	 7/ycR/NO028l8txQ/9fwxZCGn9ndIB7yTLjXUSh8XQkL0izWzJXLNINNuE6hL4X9Z1Yw6
	 Xv6ALJAzUw088pyFQ7FJMtnYf0hy4oI/OQfXcfwRty5YLK27/27zaxxv6eY9hFNty5m8h
	 GeshaC7pgWntHfLmCcO+91xuCOJMv67dlseFAOQnUSmeZ6ErgQIYN9ryoHvN9y0Slv+Cs
	 d6ha7v7LoGmjahIAJbq/Si/meClBzxWcTPYxBGp4ZIFAzj0DkQp7ITl+M4otzBU215A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xIfQV2tC;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E7B606A33F
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 15:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5E7B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xIfQV2tC
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3915471a12.2
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 07:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795360092; x=1795964892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5aYDtbjooX6OdgNuNX1vYLxnENxkXdoT7fGCkr+rps=;
        b=xIfQV2tCPRfEYIKd5yOsFfUktNOpidvo+eQqCG5LAnNkYJTn15fwtOj8Xhv7D3o5EA
         5nN+P2YUmm+fLGocWHqB+WN/BV0wdCtVR81gpHwOfh8Tc0lcQVAyRPYWIEh2h5TTQvwd
         Wvh3HQ6uudCg80Gdw3AvRmKpwE1Mmp+A3Gb8B0nfi4SMjxiO18yAj6vswi6Nn4//2I9L
         S3uZX8KxCXjkB2r+TtNP5hkZ8Ate4FzFTPlRHNow84McuTJyMXndHRAhhLolyEfyv7UV
         35VmjVHIBS37a7fyoKgYkUeXPDE+KyKl3e/x+qv1l/ATzkYn9adntjfUJfERqZ73pESW
         OH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795360092; x=1795964892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5aYDtbjooX6OdgNuNX1vYLxnENxkXdoT7fGCkr+rps=;
        b=ORBncZfEuL+krSiqsP6qgdjDTKaYYYzYcUzJ04Jyz4D7DsmmaWvTKBjoDCXFMsTF7c
         D0RQtol8ynqigjr52y/4tkQ5tx/gZkkThGygblEzj5FLOZvwZGVTTr6sGSeAM0rZO9uv
         FArrvsOObAeioA521GqEk+2oScWjbP2YDLt7yu7jZLo1lL4rFszJY5nW7b1bnPBpvKv7
         bjsz1b1xoq7EUSN4AmaSg4xI8LLqcX5sjrt1bcQoyXrifYU/qgI/RQXVWXXpDgOQzVuz
         deXsL+SSZ9ntid7fuqOJJ3Woogu9/FXp6VfVHZuoxEP30JhUwbypo9yCpND91SCT9JaY
         YAFw==
X-Forwarded-Encrypted: i=1; AL+hErGTt8wCVnDbV+bABGlKxNprK1rFGNbTClcwVzFGs/TM/y/n6KPIxSLpoJZKR0wRnNuqiegLITv2vFYebg317Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8+txXMkItYbByyPaVC5WNqsunAcIcBB4BN2qE6dvhIj1Rv4eHv
	XG71RG2IMbYJgts6co/ipN4lOS3ZvCoemgcWHeN0niU2Izgyw8+5e4ouOBtYcRQHMQ==
X-Gm-Gg: AZFdTZcdRA0wR/FSLRAYABc7TSPuLOpqyTGruBJd3wIFxaW4roOaqzb3oKKOvvUGJx3
	yiQ7Vp/yEuz5ARURaTia8hTFx/psWvhqSS/9iJBSQw5wnJhvZc+ZyGvXo5HgxCbVQ//hd3AyVWE
	Fk5c2ySCL5T6/AeWTKpgQ+FqRSGWHPzZ0sGHdfZKB+m2jtojC/e1a0OE03Xc4/WdQvtH+sX1tw9
	ALo/lgCVKoHN1TJO42lHt100+JwFMs2wTyjYnUHPoGsqmyWUjX87yWdMdQy1SkA6vlc+doc1f29
	Nf/J2o+rY/f5870u61RjW+9cBiyhLTWnVnKM7/41JXk5Be+jnay8pJnzELWrCyy2H/4M/cvMF8Q
	uRAB4VqOBvokM+2w//uIpS6pRgK9bTJOoaHa+etDiP5jCeZ2YZjNoPdSSAORiSEQRDDsQ7dOYqx
	UIOhzOqfiINmukjz0l+ylvi5q9dAyKDe/XbLHOvNJ5ZpynBEVkYztFGZkJbDHLjsTSzFUxwDlaC
	HoiKNia7avJIic1RJL7lCi/vGE0FIfdwhrq+brx0j17ep1chDPsq4QrmYZNfoyYy+ufbGU2NUAj
	Q+HBkmPBTarzgA6fFN6+1RRQcIxWEwzB2U7rf1pRCZB5oc5YybZ8QUbBBxHyn5fRmektWOXb8rC
	b/BKtP75whpyDvL/9bIpsUmvPvaPJv4Tc+8p32xeB/FJ8KApMJZPJ0f8+Xwf5JFheYx+ryWML0V
	04cv2grCBweOy66Lbrv1/+Jjsnn8y4SEViwzA3ouyl8MhtOy9H8kRDXIp4lLkaCpXuvc5XpbQ5v
	Ued1qrU8okzpNRiMnYcU6fW+9pNBkvhsa6a9qrwUq88sYGQkptYv6tOK2oDd0tHBuIB3HzNjBNb
	ZM3n1uKyVps=
X-Received: by 2002:a17:906:1955:b0:c40:4848:f7fa with SMTP id a640c23a62f3a-c513ab1dc62mr553994466b.44.1795360092258;
        Sun, 22 Nov 2026 07:08:12 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.181.130.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68887sm324618466b.20.2026.11.22.07.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:08:11 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sven Eckelmann <sven@narfation.org>,
	John Crispin <john@phrozen.org>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v3 1/2] wifi: ath11k: forget a key the firmware failed to remove
Date: Sun, 22 Nov 2026 16:08:10 +0100
Message-ID: <20261122150811.3135445-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122150811.3135445-1-julius@bairaktaris.de>
References: <20261122150811.3135445-1-julius@bairaktaris.de>
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

mac80211 frees a key after set_key() with DISABLE_KEY whatever the
driver returns. When the WMI command to remove the key fails, ath11k
returns before it clears peer->keys[], so the peer keeps a pointer to
the freed key. While the firmware is down, removing a station frees its
keys this way, and the following ASSOC -> AUTH transition passes the
freed keys to ath11k_install_key() from ath11k_clear_peer_keys().

Clear the host reference to a disabled key also when the firmware
command fails, and still return the first error to mac80211.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Changes in v3: return the ath11k_install_key() error for DISABLE_KEY;
the PN replay result no longer overwrites it (Sashiko review of v2).

Changes in v2: new patch.

 drivers/net/wireless/ath/ath11k/mac.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d1..48795c72d2982 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4521,6 +4521,7 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	bool is_ap_with_no_sta;
 	const u8 *peer_addr;
 	int ret = 0;
+	int pn_ret;
 	u32 flags = 0;
 
 	/* BIP needs to be done in software */
@@ -4615,17 +4616,25 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
 			     !arvif->num_stations);
 	if (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta) {
+		/*
+		 * mac80211 frees a disabled key whatever this returns, so
+		 * forget it below even if the firmware did not remove it.
+		 */
 		ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
 		if (ret) {
 			ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
-			goto exit;
+			if (cmd == SET_KEY)
+				goto exit;
 		}
 
-		ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, cmd, key);
-		if (ret) {
+		pn_ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, cmd, key);
+		if (pn_ret) {
 			ath11k_warn(ab, "failed to offload PN replay detection %d\n",
-				    ret);
-			goto exit;
+				    pn_ret);
+			if (!ret)
+				ret = pn_ret;
+			if (cmd == SET_KEY)
+				goto exit;
 		}
 
 		if (flags == WMI_KEY_GROUP && cmd == SET_KEY && is_ap_with_no_sta)
-- 
2.53.0

