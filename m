Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018712;
	b=yw4YQXOx70iOt6Dp5A6D13OPmPJZVfLruhNhVinwjHAkwnGMM1GLUX4yqdikTGBVSRp/
	 CFeZWX1UgVD8e5a0fomKDl2VjXpPFJAkl0dwSPfXZaJKDbhVOwAMc8s18Jrg+fYn0QWRR
	 nEOpY8Bmz7i/mnw74gjtzqRJyVJxgr5NU/MwvLqcRHPslIuaCdygLjDzZ5V+ptSufXcPP
	 g33vnnom/VWTEG7S8Wa1JORm7IzlAM24cPYONBIBR91RHm4VIPcKFWofB5hfH2uqL/bgH
	 /JL2/s70fL9gHIAc/jFtbDyBN7vTtYvLaaYNlYrTpUoG9IIHEz+SXK+j6dqyQTKz+Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018712;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=udUm9/UBpdhwVKv9/QrZ6AJazhD5JtgaNe/20Ximlf0=;
	b=hHAeejv5qO8i1BGpEC36H2Zq1e7hkJ1E56CC/gU8fSHGHDX60JBqOl2ZJNPohL1Nbqpz
	 9wrAxTQLCeXBBItDgH/50VSDp2IjX1yuAWjp5fGbehLtcQGtfRFfL+NBOubMBpXk5fbBE
	 BUTht8oITl0pDeTiZB+hXriGcgADVCpuhTT1tcrNm+9Zzqsb1e/QXPK9Qc5rC7SCNeaOk
	 zKbwXlI5R8FTHJZ0L5mestkJ7GApXeVXQroMAlgoqPFoaG4NmmcHpybLMiGtS/5FOgfwD
	 WlyTN5dMwBzUxCxkcxlb0abUG3hqMgKSrQpJz7p3/71nonWAdODAEB34QfXEmnT4KWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=iIa6N+dH;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28210606A32F
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28210606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=iIa6N+dH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=udUm9/UBpdhwVKv9/QrZ6AJazhD5JtgaNe/20Ximlf0=; b=iIa6N+dHF3SdU7zQhxhxMt1GZF
	7A4jXtctns0UxqvKXeZo+VCcOfJ/7FoY8Z0ruOEetovUHNfxP0FRr2ghKdCTtT+ujwRsThMNWxj4y
	Pa4IwzWQPLXwLMzOoD774rmlEkbHUbOaAz5murHbap1NRtPkTSdijeiMYco+08Q2chpk=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTiMg-00552s-1l
	for linux-wireless@vger.kernel.org;
	Wed, 18 Nov 2026 17:18:30 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 05/16] wifi: mt76: look up the BA session of a BlockAckReq on the primary link
Date: Wed, 18 Nov 2026 17:18:16 +0100
Message-ID: <20261118161827.1208649-5-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118161827.1208649-1-nbd@nbd.name>
References: <20261118161827.1208649-1-nbd@nbd.name>
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

Since RX reordering moved to the primary link of an MLD peer, wcid->aggr
of a secondary link stays empty, and mt76_rx_aggr_reorder() follows
def_wcid to find the session. mt76_rx_aggr_check_ctl() does not. A
BlockAckReq received on a secondary link therefore finds no session and
releases nothing, and frames behind the hole wait for the reorder
timeout.

Read the session from the primary link, as mt76_rx_aggr_reorder() does.

Fixes: 6ccb6bb9bd7d ("wifi: mt76: mt7996: Use deflink for AMPDU rx reordering")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/agg-rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/agg-rx.c b/drivers/net/wireless/mediatek/mt76/agg-rx.c
index 49721b4faab1..5e0adbfd36a6 100644
--- a/drivers/net/wireless/mediatek/mt76/agg-rx.c
+++ b/drivers/net/wireless/mediatek/mt76/agg-rx.c
@@ -143,7 +143,7 @@ mt76_rx_aggr_check_ctl(struct sk_buff *skb, struct sk_buff_head *frames)
 
 	status->qos_ctl = tidno = le16_to_cpu(bar->control) >> 12;
 	seqno = IEEE80211_SEQ_TO_SN(le16_to_cpu(bar->start_seq_num));
-	tid = rcu_dereference(wcid->aggr[tidno]);
+	tid = rcu_dereference(mt76_wcid_primary(wcid)->aggr[tidno]);
 	if (!tid)
 		return;
 
-- 
2.47.3

