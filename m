Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628189;
	b=s4om7SR1vsc2ccQlu4EPu3gJyEVipn2C7wxi4zALFEuH3ug2m+nVYURnAbL//x6NNOnV
	 0r7ZTb6B9uicehy5yuj5Z3MFD7OoalArTuOOq+iKzfwfJDbJtIH4B7CIYGquswPQ1E+46
	 VPYkVNXxHavSy9tF8p7nPR6xuw0sR7z4nFB7mc0GFm5osuRXfYETVdQRIMrvV6EHz/LvS
	 TBUn26eVoyv9jrOIY44hOXOSMGbiWVBOe2VDZZdkWnuTWltTvi5cTpz9QX6iG6utuza+m
	 yKQ0dcZPKSgFNblEr3GwnnAkW6GWCmPBQQvVI1CePk0fyl9ExNVvovdHcQPZDzyPwSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628189;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1ztxpMxq3cvJ1YUuVUr0ixxIMAB0zQMOQHOgHq0ev4o=;
	b=Uh5nKv2LKCj+hgJkcFnNydoQpDsA8WNvV441u2KFYLo0mXF+1qqykDgjhstaX/EwdbTP
	 yqnTD0JrzHcGgRJzKjfUlWTNNsiemgP288NsnD5sDwgmcVp2tkIHQPE/o/i5ksrH/FhKf
	 DuQT4b9zQcQQNQDqkn6ddIbAL5U8FL9GeoX0WsSFZCg4zhBmciMialjuD+AtI7POY7EKq
	 7GhsHBVa+/WA6osbHhBHeOHuxXqX3dtWn20kE/1/GytyIad6RMohpNtBJZ0MJu4LWMYND
	 hVYHIoTXVTlRyJCVoetAI3xKYmxrS03HggH+7BDRCKMSXQKi9Tu2OkFUMUlQYD1+bGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=KhFJSHqA;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EF8606A331
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27EF8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=KhFJSHqA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1ztxpMxq3cvJ1YUuVUr0ixxIMAB0zQMOQHOgHq0ev4o=; b=KhFJSHqAWh0AKCHtzJ6u9c2NPd
	lHPumX0h20fpwfDMxE2DTxK4T83B0Wn4XfUaLfuCyathpb2rdKj/8SaRGWEjVTrC4JWcsBBvVprxJ
	FI5ImQ11k7eRvh7m7UqdThovIaHM7B2D67Amdy9mKER/pW3qp7tKaNcYYW4zctj9cPYY=;
Received: from p200300cadf00a300521515e4a5376631.dip0.t-ipconnect.de ([2003:ca:df00:a300:5215:15e4:a537:6631] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWGux-008IWP-2K
	for linux-wireless@vger.kernel.org;
	Wed, 25 Nov 2026 18:36:27 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 15/18] wifi: mt76: mt7996: send HE_BASIC for each HE link of an MLD
Date: Wed, 25 Nov 2026 18:36:13 +0100
Message-ID: <20261125173616.3776951-15-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125173616.3776951-1-nbd@nbd.name>
References: <20261125173616.3776951-1-nbd@nbd.name>
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

mt7996_mcu_add_bss_info() adds the UNI_BSS_INFO_HE_BASIC TLV only if
vif->bss_conf.he_support is set, while the TLV itself reads the link
conf. For an MLD, mac80211 sets he_support in the conf of each link and
leaves vif->bss_conf alone. No link of an AP MLD or of a station MLD
thus gets the tag. The firmware then never programs the TXOP duration
RTS threshold of these BSSs, which only this tag writes.

Test he_support of the link conf, the conf the TLV takes its values
from. An interface that is no MLD has vif->bss_conf as its link conf and
keeps its behaviour.

Fixes: 34a41bfbcb71 ("wifi: mt76: mt7996: prepare mt7996_mcu_add_dev/bss_info for MLO support")
Fixes: a9eae65d97f3 ("wifi: mt76: mt7996: Export MLO AP capabilities to mac80211")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 1c4bb5706d49..df08c4bba0e7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1388,7 +1388,7 @@ int mt7996_mcu_add_bss_info(struct mt7996_phy *phy, struct ieee80211_vif *vif,
 		mt7996_mcu_bss_txcmd_tlv(skb, true);
 		mt7996_mcu_bss_ifs_timing_tlv(skb, phy);
 
-		if (vif->bss_conf.he_support)
+		if (link_conf->he_support)
 			mt7996_mcu_bss_he_tlv(skb, vif, link_conf, phy);
 
 		/* this tag is necessary no matter if the vif is MLD */
-- 
2.47.3

