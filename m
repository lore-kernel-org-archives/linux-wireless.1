Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871139;
	b=CkhTl9/RZcj4x3jx/jY3xdDQa1Qo6bRDCkTEcMvwS5soH3t4yOdeyHwekYPX1wkffj18
	 2xIxT6NuCIQPDiiL6rTxELBzem0NyDI3csb0uygxDn40JeFhpaSUuuliMueRrNwV2ydNh
	 W8w7uEezvbzY2fPXudkvJnJ8idnBD4CNU/JdPmYW7/XySz7es+TY0NG5faQAMn508bnvi
	 BUMmxhGV+Vtpdn0oUswHoGTgEeaPA0MPVpcZAMOLhB1EPDIbpzRE0KOpfigVhW0Scd2MR
	 ziSApTROnEgz8WV2WKRPXK8Q/uugFMzRprihsIHHpuew+eTL9Znv1mGxBsoJcSxkxZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871139;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bsLcNNgQGkV7kIB2Jc2TaqavrWinMHs83TVWzb59Ej0=;
	b=YQRgcDYXbO9yc/B6WJo1RMeVT2ChQR3N1lehLJA7rxcjFrjTFEThTQTl0VZm2IwgZoq/
	 1T10Tz+NAfkQCuBOhZp+6DYJEAgpr4+Mxl/k9CsLgl6bWt12hlepoDgjCyEn/ODVNC6cZ
	 0FHms1LC+PFeWbwp5ZYSWZ/DhvTQtJj7Akex4HgAnaqsMFrWCNXDRk29EGEfav/qyQUg9
	 iv5wUjhSx3lo8ymlz/523JK4Is7bMY4co4wFFbY15g6cgFdJsdvbglY68qkjBj4Z+Dhxn
	 b+zHqAku6yXuow/AYkTQ0iHQQD511Z/M93vRsQrJ+lRDeW0E6RxyPP9sgFbiqywZWoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44A5606A323
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E44A5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-51f2e9e6987so240393b6e.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871138; x=1795475938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bsLcNNgQGkV7kIB2Jc2TaqavrWinMHs83TVWzb59Ej0=;
        b=eqiXWKN96R/vfPQagukkQqKRxggiaBrCLL/jBB8xfDjnfDLmwdWcvBJsnlY5xvepa4
         DSR4FqINcA/LZE7nZrT1XYiOEbCyaEnjMVxJGOxsdk1oPNkrCFC+bCvWTUmL9o+Hv3tJ
         J4YJkJUH3mzdo6LRd3fPw4NJ82j4MDn88EV5OuM72MJCQjUvqz8ki5dZt3qQTmAXWmF1
         0c81ad8yCpZ1lhwzBWR1K8AYw9zeSjPwt8qZXq5Knq6g1bBRyS9HRU7DnxwduZJSaxEz
         J6tgyxDdS2jJ/Q/Q6YRSn6+yNBs4DDlzdnsbBB63I10cIEF1H5Td1WjNi/ck6sas3fHx
         up8g==
X-Forwarded-Encrypted: i=1; AL+hErElTOSDCh54jk44DedHr2c+ooyAZjr/Q9Hf1piuiVqwRCIwGGsJAAfkjPuS3PEHDXZrdsbgQVO7l8UUaN2gYw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8xE3v5ewab2g3cugap903glKRc8Mn+Px4bUv6nhDOgJsmn1PBX
	k7691VQfc13BYQjMTxPpNSjFboavRDDx45ONHXDU+8yiUQdUFIoa9oXL
X-Gm-Gg: AYBFou1DRDdSJwwZ2AHrA7deqjwT0Awwe7oT1F6EE4a6AQei8h+oLBqetslW8/5kCwV
	Vhg6uf9Ch6/jSl9XqdDDjgoljg2SdHjADviljGo+F3rtU+dPbBGhDYZ4zeu3pPt4nYWz2Eu7M0L
	n69D7pDsDE+kjYBk8EJ9ogo0dzuDekthDR98mMzc7/DIcLPYEFMSKbAv2AoX1TDknzJuv9/ZJqS
	HkKFyBzHHZ3KHcTTlAGx3MvM/g7Ik+TcJ2ckiriWzTwtCZG3pT0dZZ5pLvoP+LKKnmZmoMHMgJp
	3Lo14n7glqqvb2k1pFev2i2Q+qdJMDk4aZUATzRMijjaBzg79UQWT3diocp7PHoFoPnMtyps42J
	gVmZdH4DP0ribxcAgeaG/H4fqF3wzPhJcWSafWw0bxFAF9oT8NXPx8mkBxqP9SPPntB0yo7pSuC
	C7Bu5OJuT7SBZ+GgphnmjwGuMHnhAt9bM7YNpleLWCfl6WMAYBWQSzNtQ4lma8q9SQPebeR+EX6
	56YOeAGM+i9f3Xl3DzCrqXi5TB/nU4nzRHTrYDI00/ne/yo3xG6wj3JVDe3TZ3+w+niO8eATK9Q
	QSx2w3l6OMMw+jpqjOOq0jnmteeQJlbKDDcG2SjduqCk7IZ9a9sU5RKZ7rHcl5XT3L/LqJPnuN2
	QwAvTRakV
X-Received: by 2002:a05:6808:c123:b0:55b:fc1e:bcdd with SMTP id 5614622812f47-575db6543c9mr836957b6e.14.1794871137929;
        Mon, 16 Nov 2026 15:18:57 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:18:56 -0800 (PST)
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
Subject: [PATCH v2 05/19] wifi: mt76: mt7925: install NAN BIP keys standalone in sta_key_tlv
Date: Mon, 16 Nov 2026 17:16:16 -0600
Message-ID: <20261116231630.1733906-6-sean.wang@kernel.org>
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

From: Chengwei Yu <chengwei.yu@mediatek.com>

mt7925_mcu_sta_key_tlv() packs a BIP_CMAC_128 key together with the CCMP
key that sta_key_conf cached from an earlier key installation on the same
link: cipher_id BIP_CMAC_128, key_len 32, the CCMP key in the first 16
bytes and the CMAC key in the second 16, indexed by the CCMP key's id.
That matches STA/AP mode, where the IGTK always follows the GTK on the
same WTBL.

A NAN interface has no such pairing. No CCMP key is ever installed on a
NAN or NAN_DATA interface WTBL, so sta_key_conf is still zeroed when a NAN
TX IGTK/BIGTK arrives: the command would carry 16 bytes of zeros as the
first half of the key material and key_id 0 instead of the real 4-7 key
index.

Restrict the combined-key path to non-NAN interfaces so that a NAN BIP key
takes the generic path instead and is installed standalone, with its own
keyidx and its own 16-byte key material.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chengwei Yu <chengwei.yu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index c800ec2f25dc..a902fdd441cd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1458,7 +1458,15 @@ mt7925_mcu_sta_key_tlv(struct mt76_wcid *wcid,
 		if (cipher == CONNAC3_CIPHER_NONE)
 			return -EOPNOTSUPP;
 
-		if (cipher == CONNAC3_CIPHER_BIP_CMAC_128) {
+		/* STA/AP mode installs the IGTK together with the CCMP GTK that
+		 * sta_key_conf cached earlier on the same link.  NAN has no such
+		 * pairing: no CCMP key is ever installed on a NAN interface WTBL,
+		 * so sta_key_conf would contribute a zero key and a stale key_id.
+		 * Install the NAN BIP key standalone via the generic path instead.
+		 */
+		if (cipher == CONNAC3_CIPHER_BIP_CMAC_128 &&
+		    vif->type != NL80211_IFTYPE_NAN &&
+		    vif->type != NL80211_IFTYPE_NAN_DATA) {
 			sec->cipher_id = CONNAC3_CIPHER_BIP_CMAC_128;
 			sec->key_id = sta_key_conf->keyidx;
 			sec->key_len = 32;
-- 
2.43.0

