Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871146;
	b=d/PNJj+IbSqrtL1ySSqeiq1VFWbl4uY/bIBcVPUZI8XT5WgWL1IhXWYE1adftUSWDQa/
	 u4MiOwpCaB2gr8URi+cJBmezalhgYGJQctv9S82YurUEkAB5m58XcB599BnJa6QrED3kw
	 9Jq40rnx2GItBgUdjtpXn9WcZbmu3FehDag+ejhm8TneMxaIBDUryP2BKUOEyJvkF7lD+
	 xT5MBO+nz6BuWEObt6IxOfD68hz4Eg2yruETk6Lp0DxL6iHUx7HPeTF466Je+hDy0PcUM
	 j3Qlyvh+Wh3Z+h3tmTrGpWjNCHqtPkunxTs19JY4P2vEN78mMr+vKksI7Z4x5gdgUPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871146;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vDB9Oow+gwU7ZWLTzgkmtyG2uNtZJvw52UWjb3DFprg=;
	b=ij92IHVRl3IzdKDSgbD0G0nZD6/tjOnpmBG3POYFYNF/15g6IwNjD6PoHqoFen2yI7YP
	 2gV1V1Sy8wse3oZGRBbf2wdPw+KbStk8zFDXrvTlVom6wTMpDdTQtCRsutU9WI3ISKhOU
	 72/jvFOdljgbl0U6BxlsQNGN9OgquYyL72lOx+q0mqGhmGTvchbedo0lDAGtPqmqSL/WQ
	 Fz6QhDmFwUH2E7g8nzGqzyGtpg62i/fwGtIyWSfMKJv+mmfG2tTYu59o6cyqXdtpJI97l
	 cxtpkb9iQRdJGP+LJJobVZI62QygkmBB81T3kKrP2M9Sa9Nuihs3v+g+SbIccYObVMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859B0606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 859B0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-56431524c22so1286258b6e.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:19:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871145; x=1795475945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDB9Oow+gwU7ZWLTzgkmtyG2uNtZJvw52UWjb3DFprg=;
        b=1C9r64CqYdO8p/K1+IS5fdAJZ2jWx21XQkUG7X57gvn7LC1Lrv8DPszVYiainBRZ0N
         +84ddZTdaEEuzFvG3B7lLzGFQyo+l+isHyIOw2dZY9sVv9B0bDyadr9UX2gu0KdzKuwf
         NMVDXE1NXAcr2OTT3M4mgsOg6hBwkiTgLRjjYdZ/IkCZS12bDsa37fHuGxZhRkJWjcph
         lHvdzy04/3HJeMobz5IBkc/ygGz4271mPfSkwybwwnynVna9Cj3jaHaCShCUGz+q5GD4
         WQ7kVJDOtdbRRS+cz7qg2GpOfIpmoG28jrhCZ71CY+h4Z2fQnLSkLn2b/VDP96Cmv9vN
         QUdQ==
X-Forwarded-Encrypted: i=1; AL+hErGubKKXFZ2f7v974byXE0BUYkFH0tckLnrhX0RVauUU4p0mV9RrYdMuZ1M36A6u7TFPD412RhYegsAnpkvQbw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+w6ULS42lwU+be1MT3nodVb0WQJ0GhEF5WOZnhadoeZmxKLCOl
	ERkKND3RZx2AGCK2UoY94NCQXJWyduMvq4qyTfq479VcOVQ6ifwzLuYN
X-Gm-Gg: AYBFou32TCTpjSvvwXacYR/1hZaRkyU3ootFkdKsiB6DfCoenp4OSWRayFJD9mZ0NxR
	QscTHGt6Jjj9jb1hx1ouOSGBQe78mSRV7HlkWDcWUfvnbC3j5CJNH8slUIkMxj6psagC8Sk/iA0
	ZuEi0hZChD5JqSFXVeEBPLGiQuabAxCeJcQSXVjJDHYSsXdLUzC/DwHpR0ResYcC53s+bSp5/+i
	Cs3Cu1G8TprJYzrRI5UEWFWW86iDbOIB6shOzJPA/IOdscyRVH3fizToRp1gOa+ilvseABqwE7o
	VDxAjkF8QKkeOF8RLeKVsskJ1QT03af37wJ0IovuHZ3CFtip2Wr8sz8xOrAbrCRRRusOLNOxl7s
	cZMrXVH2faQYP///u/iL23mspj48sijUiMh5UVsvC9O2tOTP5fByzepPPri8xAuCyPxzZV0YhTA
	AfQZS39lROairTBnFvQbEVxYwZLHdMYHwbXPURSvTbIkIn4d+lNB0bkUDa0Z88cFnqfO/yQZYBl
	C9WyQ/CGs816lfzIKGMKGekxsGwkA2W0HLST4h9p2cKAcSJCFcSzwd+G+oui96M9/XV65eu0jbU
	zmfwBz/EKAvC3nN19/6Q4V9qmJYtSTa5cIrhA71LOCPaOn8oH5I4k7dsZEB6NexMZ6ho27NuURJ
	ih9H3Oaul
X-Received: by 2002:a05:6808:2386:b0:53a:3533:10d7 with SMTP id 5614622812f47-56e63ba55efmr11194502b6e.14.1794871145132;
        Mon, 16 Nov 2026 15:19:05 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:04 -0800 (PST)
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
Subject: [PATCH v2 07/19] wifi: mt76: mt7925: assign the interface WTBL to the NAN management TXQ
Date: Mon, 16 Nov 2026 17:16:18 -0600
Message-ID: <20261116231630.1733906-8-sean.wang@kernel.org>
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

mac80211 does not allocate vif->txq for a NAN device, so every SDF the
host sends - multicast discovery and unicast follow-up alike - is queued
on the dedicated management TXQ (vif->txq_mgmt) with txq->sta == NULL.

mt7925_mac_link_bss_add() only programs the wcid of vif->txq, so the
management TXQ keeps its initial wcid of 0. The mt76 TXQ scheduler then
resolves dev->wcid[0], i.e. the global WTBL, and every host-originated
SDF is transmitted on it. That WTBL only carries the parameters used for
beacons and has no usable unicast rate, so a unicast follow-up sent on it
is frequently not heard by the peer and the send is reported as failed.
Multicast SDFs are unaffected because they need no acknowledgment.

Program the management TXQ with the same interface WTBL that the beacon
and interface paths already use, which is fully initialised here.

Instrumenting the TX descriptor write shows every follow-up leaving on
WTBL 0 before the fix and on the interface WTBL after it; a 100-frame
unicast follow-up burst goes from 92-96 frames received to 100.

Fixes: 0f3605e4f8de ("wifi: mt76: mt7925: wire up NAN operations")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index a258996a6aae..2ff58b0742b1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -458,6 +458,17 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 		mtxq->wcid = idx;
 	}
 
+	/* A NAN vif has no vif->txq; its SDFs are queued on vif->txq_mgmt,
+	 * whose wcid was never set and defaults to 0 (WTBL 0 has no unicast
+	 * rate), so unicast follow-ups go unacknowledged. Point txq_mgmt at
+	 * the same interface WTBL as the beacon path so SDFs continue to use
+	 * txq_mgmt but with a properly initialised wcid.
+	 */
+	if (vif->txq_mgmt) {
+		mtxq = (struct mt76_txq *)vif->txq_mgmt->drv_priv;
+		mtxq->wcid = idx;
+	}
+
 out:
 	return ret;
 }
-- 
2.43.0

