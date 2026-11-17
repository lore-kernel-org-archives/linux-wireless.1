Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938512;
	b=1CGmSV8o9FHF8qicrLhFPC7RgRQcKpWesHvtRfrdJAfVX1GYaXkAqg6gMyYTgqCXfStv
	 jnqFL8OiCuAy7Z4/6Wj7qraLazEikQjf4GoUft7SpbhoX6lXMd7LnpScOcrVlfPilUF3x
	 pNk3AWUtnZAtr+boS/8/csLxMPGhUtzaG+MnatBen0eqSSjIwQK2UUCqIKzcV/TBSalqg
	 sxhGBUx3HVCx8FJPTsffNqSgqYyhjHVQS1qXavW/WqpQKOpRxdTFNHZQSmYwUSA/DkCjW
	 kCOEtKkVnEP3voW8MoSVnrQlzQNrbUTX187niSx/qHHbR2VvHp5zAg9DsCwr72iNwsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938512;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Xe/6r2spAyTgRik4r4ifbR6QR0bGYbOzdq/49tI71mI=;
	b=b5EfaK17lL74C4699/AiJ+iRpHfN5UzQhloW3nmiOBOOQPcR2HYCkXcVycQw0tcVHcoB
	 FN03D2z02nQIrEEAifxUKacm/dQXc9zqprv4RQLW23hN/flXguDM60bzctYfCSxNMONFu
	 azICk2Awtwne7+FRvj3bBwWOy9ViWNMBMshgJp6sKonW8fhxI87Rj6KG0ZiUd3nLhZCr+
	 goJuGK6oh/l5GHiWh9Lx/TmATBKcYJHmAmtSfdUGGZdSnb2wqFrCwIvFIihBQfncoCTIW
	 WgZwkHa8Cr0rV3h/0l98VV78JAPTPlFV1kcNKsmTMCKWD6CXgHauoPTZfl9M/Fb4o/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=aSS3U2EA;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A08E606A88E
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A08E606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=aSS3U2EA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Xe/6r2spAyTgRik4r4ifbR6QR0bGYbOzdq/49tI71mI=; b=aSS3U2EA+ovDAb3Wj8ADG4UXut
	rHBWOgIm7Meu/+QTCr9QNARnFvmlixJP50fONWe+G6gCuwY8opVSPYUR53rDB8FT+efwffcRFI5ez
	j7tBKXDl2bW8+JOh4wBjwThnCN2C3ypZKPX0y2rS0rko4WN+5w9KrlGqv+/s7VS/uPNg=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV1-004eiZ-2k
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:43 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 11/19] wifi: mt76: mt7996: set qos_ctl of a frame that hardware reordered
Date: Tue, 17 Nov 2026 19:01:26 +0100
Message-ID: <20261117180134.2940930-11-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117180134.2940930-1-nbd@nbd.name>
References: <20261117180134.2940930-1-nbd@nbd.name>
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

mt7996_mac_fill_rx() returns before it sets status->qos_ctl for a frame
that the hardware reordered. mt76_check_ccmp_pn() then checks every
such frame against the counter of TID 0, so frames of different TIDs
read as replays.

Set qos_ctl for these frames as well.

Fixes: 950d0abb5cd9 ("wifi: mt76: mt7996: add wed rx support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 2e1d98bf823a..c70e429ab419 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -707,12 +707,15 @@ mt7996_mac_fill_rx(struct mt7996_dev *dev, enum mt76_rxq_id q,
 		}
 	}
 
-	if (!status->wcid || !ieee80211_is_data_qos(fc) || hw_aggr)
+	if (!status->wcid || !ieee80211_is_data_qos(fc))
+		return 0;
+
+	status->qos_ctl = qos_ctl;
+	if (hw_aggr)
 		return 0;
 
 	status->aggr = unicast &&
 		       !ieee80211_is_qos_nullfunc(fc);
-	status->qos_ctl = qos_ctl;
 	status->seqno = IEEE80211_SEQ_TO_SN(seq_ctrl);
 
 	return 0;
-- 
2.47.3

