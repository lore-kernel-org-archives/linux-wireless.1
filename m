Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794763675;
	b=FvW00hUL+PI/H+VsX2g/xUnN7m1WGMcB6nZU8UzQ3vxroUHmC05f2Z4eQwf0qM09H+Yb
	 B9uSVOVPeBVy7+vD+l/kS6PKE/DxDULRUJegeWezdIwH6/DufBDxhsJGtDVMHVDfKqKbV
	 /8sCZUQs1OVsrnut//vBDZ10SBX90C5dwjLl0PJ3WRUdDBclB/LSOWLbEtH4NHFLStFf4
	 k7WqwmsHwiQiZy502NNJfjdzudlr1LNrXiDSmiZC6gOUzZ6ChhkBsyHiSD69d51eNRGlG
	 8cr2CPrylVlvS6YlOnKNkdcJxasP7qlUBZtDFytG7zCJRi4xW6qyOLKv/GeDK7WJGeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794763675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GZq1TtzkPhQy6QSrv4+k4em1DA/SMoMs8wNz51go2nA=;
	b=CIVPNa4OwEORSKHU4aVjZnqR7W+FZd108OhPDLBYy/QI7ntjEpB2xjBJSCVXtmnsQd3I
	 4SrrG8rY/6P8z1ZPbWmoknvZ/Jj+1nJnKB7mn+ivQz1s/sRhwfvioGoKuvXzMld/2xPMd
	 aWF5vZEdZ/vsJmjBpUIy73hkyeaiocmQN/NTW361fHMpsICEB/EFAE07g6HkrG2DksFqG
	 zmOuknpnzLmRTPHpnwe33rRUYf8wGwEIc/P9yrp+Je6abznCA8ijqNUPKg1+9yWBoitPZ
	 uzeGUnQp3SwsZs0bhrT6J8pU84UMrOTA1U9B3EIr/rL8u01pLVLxkZ6M0nd2LoVq5gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IFz4PIQP;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79563606A31D
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 17:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79563606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IFz4PIQP
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso1301014a91.0
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 09:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794763674; x=1795368474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GZq1TtzkPhQy6QSrv4+k4em1DA/SMoMs8wNz51go2nA=;
        b=IFz4PIQPVo5w8z3QSe61pCiJxvlS0FftGpYWp5jtP/zao3q2FjH4H+5fGGqdjb5bgb
         rAsoUpBeJF/XxjkXS0MEtKRydCwfSxIWMwtqjjL+uYgiwz6vhXW7dvMBjVpp+BCx8euP
         7bIULw7tMqP+UJXmDf/AVJT4Z2cjByeOQuuefTvZroAlTYpO64DpwR89ASDchiSZFKkt
         xH6ghRvqQ6lVefNZSa1l+cZSLBF489bKgkU0v+h/66mGxJ5o3bFAy+n4YHZvbIgW2OO1
         p9sdXYN2U7Zm/r83Cpc5PfnjVn4y1enTFkWLusp5YU9pn3tjWBrRRKBO3KKmHKkkw/Hi
         4wRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794763674; x=1795368474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GZq1TtzkPhQy6QSrv4+k4em1DA/SMoMs8wNz51go2nA=;
        b=XBw4iz9sP6In02oL3Ws4bSfFNGWUZCJgrNuaXAkABraa+pABcJlmFoiL/N81dOjjnn
         5G449R/CEwj2QrZGmM922EkFEk7wRnQyKTv6BfSQ18dURPAgkCTI8eCgwGd060MCmQre
         MjlyQmNSjI0gq6wDNP8ZQZ2pi1P5bbEG6qGIi6aJ7YPCaSIH9Y19PX6MO9fqgY6qUtL4
         a9AzYjZRfkg26z8ILUc4ueckez1SZT4k+Vpu2JSaycDUzFopNOf6BZjPwuWIZ45scPf+
         IYW26cNwSksOUQm0fyfJXZoVbbxEvg+Z4kTbUGieJg2I+Tr5dEF7WAVt559zEDwYj5Gs
         nrSA==
X-Forwarded-Encrypted: i=1; AL+hErHDV7Z+YadY1vREKIpA938qsO/z3RTGlZC3KAyCNLgOyfH/eC6kmORHxwL9MxzHGV0AAavhZ930HVbgPcwKvw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hw4LQZH/0PxGN462EJrZflQY+Vkia2Q38g3qNH4m3YSs1aR2v
	eIxZoAjqaIhikv2/sir91HNw7huVYDnEid7Vnoex+lhIRHLcpEyubga4
X-Gm-Gg: AYBFou2rTCoxHNYIRKaCfl2clXGu3bIBxpboijy9pT1wCAo39qd+LksluElBkdId1yK
	zSnUMzvINxdLF+OU+QI1ocnPmlgAouV1I3m8c/QnQoBOktQb28QiHoj94sOwTEubkDS50RfTzDW
	NNb+e9XzINha2xzhs28fKOg9C4xZivokufr2hls6q+Jmh5UV7S5czAaEJ9xZY8BpbBHJHM2Fzjo
	KTH1FPnzNDySRwKDYJyBLceilnA+SOKEXoXLS86pj9WxF4RLHndlMSpskTDn38IVo8BXKlDxnAK
	sOV3lzUxOinl7/jkAy++Utvt8HcSZ8YFdyjsZsZA5ThFF1FeSoDwX3U20+q5brEz+3+wwfFezLF
	tDSmFXjlKj63apRKvr39H+L1+sflZPw0ybQtWzNQUnOmgsTBjokN3PIY8q7zhasRR/U6cETZwOc
	AvmOgTiWDiiI92GLq/9jqH11tVU6v/Dp0zyXhrlLp9anqn8lbQFJdX8qsZDl8wzVuD3Qu4X7o9C
	NuWQK9NEz4b3z6aR174uRivbGqnR2bm5fazzG5hJ1MBUA1fu96j7gIUWdDQvIXsKNINtXohNKX5
	PU2lKlZuSZQrxmsFPLMZGGjvID3BfvwS3LZQguE7/lPc/EVBjVJdsRc=
X-Received: by 2002:a17:90b:4c8b:b0:3ac:9ed8:f30e with SMTP id 98e67ed59e1d1-3b1b0d07d05mr5600119a91.35.1794763673371;
        Sun, 15 Nov 2026 09:27:53 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:d1be:2710:af83:9beb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27cf1sm19051936a91.12.2026.11.15.09.27.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:27:52 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chad Monroe <chad@monroe.io>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Dylan Eskew <dylan.eskew@candelatech.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt7996: check the RX WCID before using its station link
Date: Mon, 16 Nov 2026 01:27:22 +0800
Message-ID: <20261115172723.34964-1-enderaoelyther@gmail.com>
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

mt7996_rx_get_wcid() returns NULL when the reported WLAN index does not
map to a station entry on a valid band. Commit a3ea1c309bf3 ("wifi:
mt76: mt7996: Fix mt7996_reverse_frag0_hdr_trans for MLO") made
mt7996_reverse_frag0_hdr_trans() load msta_link->sta while declaring its
locals, ahead of the !msta check that used to reject a NULL WCID. A
header-translated first fragment without a station WCID now
dereferences a NULL pointer in the receive path.

Check the link before loading its station pointer.

Found by code review and not reproduced; compile-tested only.

AI assistance was used.

Fixes: a3ea1c309bf3 ("wifi: mt76: mt7996: Fix mt7996_reverse_frag0_hdr_trans for MLO")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index f36da545045b..186216f21d28 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -191,12 +191,12 @@ static int mt7996_reverse_frag0_hdr_trans(struct sk_buff *skb, u16 hdr_gap)
 	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
 	struct ethhdr *eth_hdr = (struct ethhdr *)(skb->data + hdr_gap);
 	struct mt7996_sta_link *msta_link = (void *)status->wcid;
-	struct mt7996_sta *msta = msta_link->sta;
 	struct ieee80211_bss_conf *link_conf;
 	__le32 *rxd = (__le32 *)skb->data;
 	struct ieee80211_sta *sta;
 	struct ieee80211_vif *vif;
 	struct ieee80211_hdr hdr;
+	struct mt7996_sta *msta;
 	u16 frame_control;
 
 	if (le32_get_bits(rxd[3], MT_RXD3_NORMAL_ADDR_TYPE) !=
@@ -206,6 +206,10 @@ static int mt7996_reverse_frag0_hdr_trans(struct sk_buff *skb, u16 hdr_gap)
 	if (!(le32_to_cpu(rxd[1]) & MT_RXD1_NORMAL_GROUP_4))
 		return -EINVAL;
 
+	if (!msta_link)
+		return -EINVAL;
+
+	msta = msta_link->sta;
 	if (!msta || !msta->vif)
 		return -EINVAL;
 

base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
-- 
2.56.1

