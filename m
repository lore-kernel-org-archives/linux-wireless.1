Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462095;
	b=YidT/4qPnTd4fNhr4YuQEj8Bn5wLlIAJwZBEnrjgnad5SM9M/zRQKJUhN5pxmBJHk/sG
	 L0dt5ZUM7evI3ljwAugagWO+F96FVjQ/ViPxl3zvktwIrA8rxmnAVQo9Bsmj/G/MSzWPn
	 lZTbqeqbiDe34sOtT9ckjBpHCOCbU6Tn/w3z7Sd386B5qC/xz42ZcOLaQCLbkopm6VC/T
	 kyHylJYb8+Q6BCh9J7kknavhLjFZWgzLy1w0Af0XibQOhm1KzIMl7SnMTTf2hkXOGfwAi
	 6PRhBjtrB9gnqCgi0fH9IRfC+KPHzxW4LIwG5K3fVE+abMEzFYIHYntXEkNvS8yBjug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tVpg3m8XkKzY55cEmyE7VyD81pFXe7BeKUYNIVpFSxU=;
	b=Va7mecmKbL8YUVr/3JkCQbDNd/Tf1t8PGiPPggLNyo8p/IIbuM81d5dHWFTF5gLnt8x0
	 BqkeiN+XRgO/1C7bK2qY98YZmkGM44wzU7mfmdDgG/4UIujeSo1eD/Uujfm08bUVoQx5e
	 CMeu8GDhkgLsk2wmgO7t/3R2x0oTYjLxwHh1Q6DM/xS7O60Z8rnrVZLi8l95QcbN2/p30
	 hIwSGCZK/PaPWVYXRUQEDafCC6GPL/67dUVU2oP9ZNWh3y+lCHpKEwShxszldXRjVPVZV
	 Bux5dUSVIfVtB8GEt1DiyVkPIpr/NakGHYmq5SxtL/Ud+GUBZr3tQm0KNhxLaH1WCew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jPun4PYc;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA792606A31E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 19:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA792606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jPun4PYc
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-498f5fa5103so2210475f8f.2
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 11:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795462093; x=1796066893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tVpg3m8XkKzY55cEmyE7VyD81pFXe7BeKUYNIVpFSxU=;
        b=jPun4PYc206kAk+3Uwxp6Ymyh+O4JNvUqJorysOKey6OoUP4/ziwG4Htla4hDohJvY
         KQNfFR1L0mbxtyZci5Hn6ZClFI+MqLjTvujneLsOHRAUG71i89v5wjnssLr/zPDI04BV
         +NYjTAD4nZ4TVAfpswdNoqRNOrZFm89XkQak0R/mdAfT/H/pIm8cNKCX+w6Q262JFODT
         7QIYlwRgvG3e+FEYy1DDe8ORLMoLFFqIQWKVj4Ldgm1caVXrLEe55Nf65UBuBg4RNsac
         wImABrxwdg2kzf7bE9VdOWkBvw5SHfyCiOWS6ySqIIZJ/3qLt2PbHGa3RnjqyXYXgMO4
         DhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462093; x=1796066893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVpg3m8XkKzY55cEmyE7VyD81pFXe7BeKUYNIVpFSxU=;
        b=HU8N4OE6hoMW3VNfpemweRZn52ZUZ7DSgAwEX85AZuld23/GOQwYKG9SnCrX4B+VPf
         8c2pWsOZjUjdtXP21wioLO4UHEK8GuxHfGKDeQ49l9+50Tcgwds8fn+H54ZjCc8/+30A
         jeaVVNjwSU/TCM5qR3j6fS3ddVf1/jIeJoqrT9JjkkfpF5yXRWx79td0RDN3iHzp6Qq+
         VAdXizNdm0G64/xOYGtRQWzy1YwfgQH1+NOj4j5tnFi065luPwxtAVa+6g5ZZvUSerYK
         mRJipglkskCa0Kpp44zeuK6WkjtFfqLqYprbmmiuwLhs+B1B+BwG2KKo3WZm0pTTRgmj
         J7Fg==
X-Forwarded-Encrypted: i=1; AL+hErESswyrpxbL9kvujHCWsG6E3VGxizhnbfFrb5cjPwTCVKE6mKyTO/yKH16Mc578n5UkmqQIZ0KGvIOlv9OMcg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9n0DJy4XkJ4fAWVMSzpN8WIljRRZIiO2uvkbruNm51hi7i5D0z
	nHtdU15ODv3cHl+Cpaq5FzzhIk/foS90xJcPhTCN50E4SU9lIMbahxdb
X-Gm-Gg: AZFdTZflg8umlM+4Z7peUlUb/QabD2nq/Y+42AMTdwOmgmcj3jddNycaEiO3wcUNdh8
	pSl1PK463LLKmOaKZm+hGZfZe3eiWqb4z5ErZn9WmQOh3TCDjlnObVIMlIiVPt/nS0h3X/umEgM
	3FusDcdYxVPghfHUynH8yMuGzPtPjmo+Fd5Ib0zqKmAMACCsp6NXjhVR39erNJh5hrNApT5jRMB
	hApLFBYsHNxtKQXbtZA5JnNadlffGw9ss8YHiyrt5rBBfEGRfsOD2Cnz4oaNG21xEc6x/cV0Duf
	dwCBrdWWKunS0qwxqxw4ewb5lFWlLDvhF2QEyaotwK+sMyo3w//i8l5YJfCQn5feAPykCxFqkV3
	BitwGV7EAD1sMAxemjeHaSabdBhBpYwwB8lonIhb7jL+olMb82dFOBGRNjcN0yRiAQY6RMJ6gI0
	xHI/nrz27gtrV5XmxL2JLGXG0xPJQPlHTeocZ6B+B4UH5fNpaEhclhtHgRktBwKBEQCfEyJPHWu
	h0id9zl6mecXWoeHQf9OmHwdoWTbcjItWVJ18hm1SwWjw1RIlpvwEsA6LclAojXLMuWGpalD5If
	A8GmMO8P5Sr/+BAHx3P8WE+5hmBCeSnrMiYeuwxw+8MSKwju11MmR7fKJItaApMtnZIVANQ=
X-Received: by 2002:a05:6000:2383:b0:4a8:8004:5261 with SMTP id ffacd0b85a97d-4abb6d04250mr27449503f8f.44.1795462092747;
        Mon, 23 Nov 2026 11:28:12 -0800 (PST)
Received: from kidala-computer.. (ip-109-41-51-17.web.vodafone.de. [109.41.51.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm24879522f8f.8.2026.11.23.11.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:28:12 -0800 (PST)
From: Oleh Shcherba <scherbaoleg4@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oleh Shcherba <scherbaoleg4@gmail.com>
Subject: [PATCH] wifi: mt76: mt7603: remove dead WEP handling code
Date: Mon, 23 Nov 2026 20:27:34 +0100
Message-ID: <20261123192734.7149-1-scherbaoleg4@gmail.com>
X-Mailer: git-send-email 2.43.0
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

mt7603_set_key() only offloads TKIP and CCMP keys to the hardware and
returns -EOPNOTSUPP for everything else, so WEP is always handled in
software by mac80211. Hardware WEP was disabled as broken in the
out-of-tree mt76 repository before the driver was merged upstream (see
Link below), and in mainline mt7603_set_key() has never accepted WEP
ciphers.

The WEP cases in mt7603_mac_get_key_info() and the WEP-specific key
offset/length handling in mt7603_wtbl_set_key() are therefore
unreachable. No functional change.

Link: https://github.com/openwrt/mt76/commit/cd456ca87fb0afe4485ce9b091f40cf2faa3991a
Signed-off-by: Oleh Shcherba <scherbaoleg4@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7603/mac.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index 196c39f..836ce7d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -894,10 +894,6 @@ mt7603_mac_get_key_info(struct ieee80211_key_conf *key, u8 *key_data)
 	memcpy(key_data, key->key, key->keylen);
 
 	switch (key->cipher) {
-	case WLAN_CIPHER_SUITE_WEP40:
-		return MT_CIPHER_WEP40;
-	case WLAN_CIPHER_SUITE_WEP104:
-		return MT_CIPHER_WEP104;
 	case WLAN_CIPHER_SUITE_TKIP:
 		/* Rx/Tx MIC keys are swapped */
 		memcpy(key_data + 16, key->key + 24, 8);
@@ -916,18 +912,12 @@ int mt7603_wtbl_set_key(struct mt7603_dev *dev, int wcid,
 	enum mt76_cipher_type cipher;
 	u32 addr = mt7603_wtbl3_addr(wcid);
 	u8 key_data[32];
-	int key_len = sizeof(key_data);
 
 	cipher = mt7603_mac_get_key_info(key, key_data);
 	if (cipher == MT_CIPHER_NONE && key)
 		return -EOPNOTSUPP;
 
-	if (key && (cipher == MT_CIPHER_WEP40 || cipher == MT_CIPHER_WEP104)) {
-		addr += key->keyidx * 16;
-		key_len = 16;
-	}
-
-	mt76_wr_copy(dev, addr, key_data, key_len);
+	mt76_wr_copy(dev, addr, key_data, sizeof(key_data));
 
 	addr = mt7603_wtbl1_addr(wcid);
 	mt76_rmw_field(dev, addr + 2 * 4, MT_WTBL1_W2_KEY_TYPE, cipher);
-- 
2.43.0

