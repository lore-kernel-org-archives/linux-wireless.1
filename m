Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871163;
	b=mw9WfAp9yStCUd1XagbFkBaZ544ghOBNLzbnkC6A2o8+cGC4elfHE7u2eqqpjYEtHY8L
	 oYAtU6nS8lUEX54adm1RyMA7C1sTdmYuK8BTcosuIJLQ6JaA02q0cahbvfvOXNmZpBZLt
	 PHmbwQIBte2BocMpPLDUcoVkKr4YrHBQyesnKTVc/pMjQI1SAH5BhHFwNheHeognsPh21
	 SEHUm+qOuZIQ9umATZJsviY+F/IOVpggCwUBo2F5Y3sk3ft7QCmTWSybBa9rY0N4lzP1x
	 VEBlozosxqkGvb7hfSlPxu4o0X1qCaatPCGbdYNSh7PRsLeys5RJkGdTQX30XotKFEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871163;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6bZahOU0jfr1VcMxypA8yBE1XjlpO2WF8uwUxbk0s9c=;
	b=G/jWO1+hb+cm6ejud4n+t14gxiRe3Iyr7S6VddwaKYo3eLndU7/FLik2GluzP1KB0Bo/
	 y5QMN4kuPYlVPNsV/uVtH/p395tTe67LcX9Ig9z3QJ9mPpOkCURTGQSNSzJtLTqGUmw5P
	 qF85/MF4dnWlXYwREOaJonsImbDP0CZAzcMp9S4dD7gBPNlKhSZenFCew6Jq8w3DC5hhC
	 iQqOFhtxEoRVrdJ12+mD4UWxu11K/PU3JN8wx75aBjOLkomb8G7hTElU5kDJiDiIvO042
	 5QIiCOoCR3mbHG/ANO+mLwGsNYCrg7dSCHL4SWpk393qNnUCFClj2DDAPkeeP6mW7gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33792606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33792606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-43bf9548df4so5363503fac.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:19:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871162; x=1795475962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6bZahOU0jfr1VcMxypA8yBE1XjlpO2WF8uwUxbk0s9c=;
        b=lTnBFE9jATRFNNsNdezUI8iZtjgc4BIE/Fm7F9201CAqPj4wBaSTUGcCx77AOF1puF
         ys8NHH4WPrdNr9XZaY0lJzMPwDww9pW73TTUs9W10zRG67A+Wt055GF+icl7IhlCemta
         lOPNBYw4YdOSgdFEJniHLgu0lM0c1tuzM72QOHrf9QjcEpelyPV14sqaLyRmd5dVsxK2
         3BMYLb3NqAmPk/3mhmaXC7zQswUZ6xjsnX23eHSPhRx3Sjeng1wAZ64j16TXMUh4jPkH
         eG0J57/edJtgDSN4QgKv0wGrtPf8DiCrT5dXzC+Go48fLlZU8woiatkbOzX9XJ01Epem
         HWeQ==
X-Forwarded-Encrypted: i=1; AL+hErFZ8HzLsQYZ93J3EJZ+SCe3SU9ttzdtw/cOHcMwnbmxx3iBQ5/sgpkqRLENjNJicfTted1QybAoYw+tlLaI/A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8KEyBwxE5P+hi6ZPYV49ZWc8NxuFELaC2p6v+S2/LEWsY6CYGU
	3VqfKD3p+97VVyr27zo0j6go+x9BwGb/SWgQG9+IqsVdoK6o1jxOV8E2CJbyWw==
X-Gm-Gg: AYBFou0rrRbZqYdydx8gYg0SUsMAhYbJicDi9nbZveCh+9sbDKpbsIY1nziL7LhH/Iq
	YsZ+0x9NmDBZ8a4QX7SFqIhiwx16MQ5JKi23zJ/nUalNhnExzEuNm3oHZngM/tUu1xTM9Adf7ZI
	P7LEl1kS7/RUoal2PWuhGSzvKSXbUqc9jClJ4DnkwCchKBdwNWs7fxwE8+dVV+6b53hTpVUquKh
	Ikgrt18iCZLwvVyzOa9hHNyyAn/W2eSgT/YGK3AjaE0UsYHURmZeLDaKAXn5L9Hd8yWaodHlXsT
	Yq6wNmTWvHLAfb01M45VWV0XUrwglhm560VWDEwfoE4h4PtseRzhJSDGtfKhG+xJaSegH3iy+t4
	UFhmzTTkJn4WWzLFCvF4Q7TStIKjOqpIQUxkz5f8Uk5Kac4wtY80p11Q4rxcSxJIF7pfj2PGccw
	ISBNuxBgMV8tM4Cw4RfAI9guevAeyazqZ6ZgT2RfVGrYfP2YgNGeQy+GufpXb+VGWa17IKsrTHe
	sIKdK17STAVbvhvSFsbYYV5ETNxTCCkSdvedEfiVynNmttktykFVGkpfEWG3IJZ2strmWE7GTfE
	oPohkH3zsJQITdivYVwgP1ZlnFNu57qUnkzjZkUbo6ivs25/s6338JxuwKJPGWvrhOm36F5pheV
	GzR9w3G43
X-Received: by 2002:a05:6808:6607:b0:4dd:18c7:5448 with SMTP id 5614622812f47-56e654179bbmr12127147b6e.56.1794871162239;
        Mon, 16 Nov 2026 15:19:22 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:20 -0800 (PST)
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
Subject: [PATCH v2 09/19] wifi: mt76: gate NAN unicast mgmt by peer availability via STA queues
Date: Mon, 16 Nov 2026 17:16:20 -0600
Message-ID: <20261116231630.1733906-10-sean.wang@kernel.org>
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

Host-initiated NAN action frames (NDP Request/Response/Confirm) were
sent on MT_TXQ_PSD -> MT_LMAC_ALTX0 through the interface WTBL: a
force-TX path with no relation to the NAN timeline. With a partial
availability bitmap the peer is off-channel most of the time, so the
15-retry burst (~11-51ms) regularly misses the peer entirely and NDP
setup fails probabilistically (half ~2/3, quarter ~0), and per spec
unicast NAN mgmt must be transmitted within the peer availability
windows.

Route unicast NAN mgmt through the peer STA WTBL on its AC queue
instead: the FW pauses/resumes the peer WTBL AC queues according to
the peer schedule record (the committed-window intersection computed
by the supplicant), which is the same gating the NDP data path already
relies on. Multicast NAN mgmt (and unicast without a peer STA) keeps
using the interface WTBL, which has no pause driver.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/tx.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index ea9993e9a199..0cb27aaff19b 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -713,6 +713,18 @@ mt76_txq_schedule_pending_wcid(struct mt76_phy *phy, struct mt76_wcid *wcid,
 		     head == &wcid->tx_offchannel))
 			qid = MT_TXQ_PSD;
 
+		/* NAN unicast mgmt (NAFs) must stay on its AC queue: the
+		 * PSD path maps to the ALTX (force-TX) hardware queue,
+		 * which escapes the per-peer STA_PAUSE availability gating
+		 * and transmits regardless of the peer's committed bitmap.
+		 */
+		if (qid == MT_TXQ_PSD && wcid->sta &&
+		    info->control.vif &&
+		    (info->control.vif->type == NL80211_IFTYPE_NAN ||
+		     info->control.vif->type == NL80211_IFTYPE_NAN_DATA) &&
+		    head != &wcid->tx_offchannel)
+			qid = skb_get_queue_mapping(skb);
+
 		q = phy->q_tx[qid];
 		if (mt76_txq_stopped(q) || test_bit(MT76_RESET, &phy->state)) {
 			ret = -1;
-- 
2.43.0

