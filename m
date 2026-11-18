Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018713;
	b=BulRw7pIU15N9ZeX3Vuo0acvBggj0NAEu9Jb0/hfh1F8156Rths7MbGFe3wjP0xx7wKi
	 nzCOGXL6pl5MpteWDI54EwPBwcg/M8lXBYJWzOhkiLu9FICebbgGnTwPqfJFDFFYNnXj3
	 mPX/BbVvHMHrgidtKd9sPbb305wti5Bj465L7EfIsWUQO3qfNto5k7SjO7OtfJezbC766
	 8y8H5utLkKj/9Gik/k4KKfcOOU4+yo3Tue7wc/1J+IV2aQdlqA9BvtWUMwxamOmKrLxvk
	 zScZjo9aKl+/2Yj63ZncN5aOoGfir7hu8GlJMyF19qIWY3BQS5x+MZWN0yEcCag/97g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018713;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rGh2xmS108biHILunyHks4YpTmuH0BayldwWwEUZT1U=;
	b=HNze47rKgB/2kU4gdtIjVj1l7E+WcdXZZTfPtuLVvzhNTm0zkndcm2KQj0FuuFfelg0J
	 LXXiIiJXUe4bUn+XBeKzMLbAHY0h4DV//RNZdzxQ9nOqBFvMKKaob/VArOCXQYHxlRoUq
	 mfNUC0QZVmxf7kJhZlPCDMGCTSqXYppp7agW7/m2sY5hzJFtdFgAOKPNlyXD4jaJFJDW3
	 L8q/5nBUPrLfqKWQFzLqDIsxz0Jd258RmCRJneBauC+KS0mEy5nJdqLgyqpscvMIi7hCc
	 zpRU5qp4DklDyY88HmX443UnCkhBcPLn9CX6UQPsjjov6aG5NIur5jQmO89Ic6A7kBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=rfWIXI9L;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A54360A260A
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A54360A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=rfWIXI9L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rGh2xmS108biHILunyHks4YpTmuH0BayldwWwEUZT1U=; b=rfWIXI9LejDJggXEa01dA3g0YD
	jHfrvryPBCLXubNQfQSAA0NLT8AOfmUUyVXDIqWGtBOIYocCTmdD6dFxxGdeOpC2gdzrqN8KeT9b8
	4CdMoXI30xjcG11VggrsS2iAtdd66clCtPlLdLuKKSA7BSEACDaMYiptfnJdQahgu6Tc=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTiMi-00552s-0A
	for linux-wireless@vger.kernel.org;
	Wed, 18 Nov 2026 17:18:32 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 14/16] wifi: mt76: mt7925: keep the MLD record until the last link is removed
Date: Wed, 18 Nov 2026 17:18:25 +0100
Message-ID: <20261118161827.1208649-14-nbd@nbd.name>
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

mt7925_mcu_sta_cmd() adds STA_REC_MLD_OFF to the STA_REC of every link
that mt7925_mac_link_sta_remove() removes. mt7925_change_sta_links()
also removes single links of a station that keeps other links. A client
then stops transmitting on the links it keeps: the device takes the
frames from the host, but sends none of them on air. Reachable via
_ieee80211_set_active_links(), for example when the AP removes an active
link of the client with ML reconfiguration.

Only turn the MLD record off with the last link of the station, like
mt7996_mac_sta_links_event() does. A station without MLO has one link
at most and keeps STA_REC_MLD_OFF.

Fixes: a5942a3979d6 ("wifi: mt76: mt7925: update mt7925_mcu_sta_update for MLO")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index f46fb08558f9..218815e64a81 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2347,9 +2347,17 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 	}
 
 	if (!info->enable) {
+		struct mt792x_sta *msta;
+
+		msta = (struct mt792x_sta *)info->link_sta->sta->drv_priv;
 		mt7925_mcu_sta_remove_tlv(skb);
-		mt76_connac_mcu_add_tlv(skb, STA_REC_MLD_OFF,
-					sizeof(struct tlv));
+
+		/* One MLD record serves all links of the station, and the
+		 * caller drops the removed link from valid_links first.
+		 */
+		if (!msta->valid_links)
+			mt76_connac_mcu_add_tlv(skb, STA_REC_MLD_OFF,
+						sizeof(struct tlv));
 	} else {
 		if (!info->link_sta)
 			mlink = &mvif->sta.deflink;
-- 
2.47.3

