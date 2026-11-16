Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871202;
	b=LbDmi1wICYpk2cMn0Bad/N7sewhyW0pe7iMVN3SdJDbi2+CvFxJpXLO1OR7gLZA1yx6c
	 7rZPvQOKZ+8J0ON83qs/5gm/emqwCguNBjFniLYPpO+opwssn8NaNnRB3CjilqIRoDP76
	 u4qZxG05XT0iZkJR2NnIDI6zBtYu1vmhW9MYPiASMKv7nOzlR942eugTrI/O7yGEd11Sf
	 G5o8lxtukF9PZlN1tGM6m3XzFOW20CX8flF5vRwziuitc9oiyuQSwxp3jp0o/7xyOQZxf
	 jdPCR703+Juvhbo53u3YYXZ2PSLAN075KKfTxJKGvUBt3K7V7tvfgK3aRWQx/FaTFsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871202;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i+izZmq3PYV8lmj4s7PUZ89GCKURmk/0VoVafPgoYXk=;
	b=gYL+YLgJpVV/hRvHuCJjm6OK0ZqtfypjNs1xqImPgSEBeWqDO1r6Geds7xEkVY7gMwcE
	 vzKq21MzmWFF//EZ5/n4ygnJpz5aLTUAwKGx624funIx/m56PnGHZog67ILMiqrmIutm7
	 0ivA4juIpFvj63pXnj2TQNlOnIhlptgE9bWQ20UMWgL0oW7ctgE6J0ugoyOu3sJmXpAUd
	 r3VkNRxDlbbCVZq0pvODqDxKEeqoHm2+LkzxixGV/wCb17zd1Gb+PKQ1DVaFQAngicbCZ
	 yKPpI43E8wLu2YT0g5vk838vIWcAmNcXOuEmTGKj+YQI9CEwXAWWrvbKR7P9Cd7epMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF25606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABF25606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4ada9579947so2886875fac.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871201; x=1795476001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+izZmq3PYV8lmj4s7PUZ89GCKURmk/0VoVafPgoYXk=;
        b=i5mlEJElkwc/B/2fnFpPvngA3zvzPFeS9KUQpnmbzW40b2GYeD+7f09RCv2gaBw7wO
         xkwnLRvDHSnjGRdV+qcfck2Qq7CqqUFLNIaP6B1ihfpVXT+s4qVOwa/SkFnARg3rTgfy
         WJNJXd5gxz5T/WPu5ghuE4rQNc3mpPPP1odnn4DNuWHVaB3kI+T9bL2gmmT7we/n/FR1
         KQwjXLMkeOOqzc5oYjZYT5eGga8zEMUs4xL1sYzhRxao2SvtO4CjvwvjFo4+Yc1BhhuD
         V2Vz3DpR60e1AD8fxAYiIFC46fZ82wKivDN25RBX6zB680SF+GJI5vb6dwE/QrBQvFuh
         COxA==
X-Forwarded-Encrypted: i=1; AL+hErGmqNaxHpsUUT42Og1fI+xRvPX/hV9Ms7yxhS/64kVWtF7jbwploN73mQIWzSs5+yrbMfHuN79TTThbtRWR9w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8BXGnSSY0cyu7Bfjk4SQhVZzE/IkBg5ewnoljgWTM3OMDqn/Iy
	x+QIJ7vG4d+xVfs9uurqaZ5fmbJ6O0wyZrXTjasWLBqfYD7y+qbBrBaK
X-Gm-Gg: AYBFou21MmsVMtYVzN1Y+GPG5kaBWyVy8Wslx6m418eEaQ6hnyeKaOzZpsI+ymOWMLU
	jWKdr70Go4I59dpN0Xdb+bneU3iWliUFdkJaUe23mISdEzgwohDPjsyKaLpFEPZx8uuhyg/fUdN
	CPQaF0UWV+bUbrNWGFwqMp/uNIhzLU9COvCEFcfVkIcvLQSjoHnze0BZPGMjI7S6se+nY1Fw67H
	G3ZHgY15uKbMGBlESfcH6ftw1CRvdXEuNcgIFWgpRZorgAs9ODTPXDRjXpytKCqorbdKtBY0lRC
	Fkaz2o5vJhopUlfuwMwpxi/zl36RX6Zx/LTce0jaW8Hhh1rCyPwt6CPkh1qbFmNCcZqMpF4YfzZ
	J9vPs2r8k29M8A7rT0rT48XxXHqOWxBgA643MWMMmFPX1YDQP0PE4evDGe8nVkbb6pzJkcai5vm
	2n29xXM0Df8T5uPmVD1CJQ8QDTfyHYmYCwvFi7ujh8cm2rAwKScfOqynzFTOmIe9iBq3ziLHPfs
	c0bg1VMd7iBl46fjyhzwmR3up7Ojg1siakwHxqU1oSHF+S7xqAuxjUWfdBJTg6Z2oGnTsJB2vvI
	oaF6hoNxbKDQq3Q7ORSKLPTPqaYVxS4hGxCldD64faYXBgi+AQgz/Ir2P/2Q2wtlrmn8pcchK98
	Nez++mCJs
X-Received: by 2002:a05:6808:2388:b0:564:4f93:709f with SMTP id 5614622812f47-56e65a43c27mr9649496b6e.67.1794871200673;
        Mon, 16 Nov 2026 15:20:00 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:59 -0800 (PST)
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
Subject: [PATCH v2 17/19] wifi: mt76: mt7925: bound the lifetime of NAN unicast management frames
Date: Mon, 16 Nov 2026 17:16:28 -0600
Message-ID: <20261116231630.1733906-18-sean.wang@kernel.org>
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

A NAN unicast management frame sent to a peer that has disappeared never
comes back to the host. The frame sits on the gated DW-WTBL queue, the
gate opens at every discovery window and the hardware retransmits, but
the retry budget is re-armed each time the queue is released, so it
never runs out and no TX status is ever generated. The host keeps the
skb in its status table indefinitely, the supplicant waits for a TX
status that does not arrive, and every later management frame on that
queue lines up behind the dead one. In practice a single lost peer stalls
all further NAN handshakes on the interface.

Set MAX_TX_TIME in the TXD for these frames so the hardware bounds them
in time rather than in attempts. When the limit expires the frame is
dropped with the lifetime-expired bit set, the host sees a no-ACK
status, and the queue drains. Forty-six units of 64 TU is about 3 s, six
discovery windows, which is beyond the 2 s NDP handshake deadline so a
frame that still has a chance to be delivered is never cut short.

Fixes: 0f3605e4f8de ("wifi: mt76: mt7925: wire up NAN operations")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c    | 12 +++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h |  3 +++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 9837018ba193..686efd16f1dd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -836,8 +836,18 @@ mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 		struct ieee80211_hdr *nan_hdr = (struct ieee80211_hdr *)skb->data;
 
 		if (ieee80211_is_mgmt(nan_hdr->frame_control) &&
-		    !is_multicast_ether_addr(nan_hdr->addr1))
+		    !is_multicast_ether_addr(nan_hdr->addr1)) {
 			val = FIELD_PREP(MT_TXD3_REM_TX_COUNT, 31);
+
+			/* The retry budget alone never finalises a frame whose
+			 * peer has gone: the DW-WTBL gate re-arms it every DW,
+			 * so firmware holds the frame indefinitely and the host
+			 * never gets a TX status. Bound it in time instead -
+			 * about six DWs, beyond the 2 s handshake deadline.
+			 */
+			txwi[2] |= cpu_to_le32(FIELD_PREP(MT_TXD2_MAX_TX_TIME,
+							  NAN_MGMT_MAX_TX_TIME));
+		}
 	}
 
 	if (key)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 1c20b4ae7497..e58eab5a43e9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -31,6 +31,9 @@
 #define MT7925_SKU_MAX_DELTA_IDX	MT7925_SKU_RATE_NUM
 #define MT7925_SKU_TABLE_SIZE		(MT7925_SKU_RATE_NUM + 1)
 
+/* NAN unicast mgmt TXD MAX_TX_TIME, units of 64 TU: 46 is about 3 s */
+#define NAN_MGMT_MAX_TX_TIME		46
+
 #define MCU_UNI_EVENT_ROC  0x27
 
 #define HIF_TRAFFIC_IDLE 0x2
-- 
2.43.0

