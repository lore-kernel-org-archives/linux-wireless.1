Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092250;
	b=E/WEGCmEAWfXEk4EL+LfECituyaKoUVScnpdYV7SDJQo8jYFWpT74/Ihn2WB2dlbuqeh
	 A/yXhuKaaJqvHRfhYLGVvGsW0TffdSDJEorDUbKckiwJQ6OGxcW4JTWec9R9lvjV8JeJf
	 L6LFzUMJSnQH1jBrP6H7qlof7/3c3/Jszqpz+jMVB+ZlYBkSpaA+5goSUTelemM7NUAGA
	 ezWjQLXRUwBHu0yGqfaqb4KzpGgJsjDTzeKvdB5gx1CLjkv/hd6wTdmUa0/QIdw+tv/wK
	 eYWCL4sIg7uyRniHxOOOSpMje7e0Y86Xj6M7ib9/IgcSi/wjUlczeg5yXio6wsRnT1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092250;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cOsJfJDBumjVerscpcR3/u/UBrlvTRpFhiwuEF4TleA=;
	b=YtKyklNdb0kxYjjaUbsNn1RNWy22ICrYdzhTpGywn6yw9wkl/OZx6xNkPsQQGEnkNBvH
	 sGHrB+n0489wrf7rBdOQOpEFbqybdVJGa8kJKkU8Bj2NCEqn0UDgejTyRk5PSK5tB7dvP
	 sPF3gX9Kmi/N4aGO+D9DcvCafQrLSQfuE5QV/49D2n/LzDfBDEHdp388NiQ+0EwlDvdep
	 Hqfj1IIQNN2lMxRXi/yPjNVgH/hYhxc0FHlTocIasjVHmNy2Ifb3inHms6kfkAtCPW6Md
	 l93K/qqr+0YcUnYZ0pZbsQLjy4StCVWmsKg4gnqSNx0Vc7CsaUKJJv0QCS7PrMr0H5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Ag2S8HTO;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED7060A2603
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED7060A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Ag2S8HTO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cOsJfJDBumjVerscpcR3/u/UBrlvTRpFhiwuEF4TleA=; b=Ag2S8HTOxji/2K2mf2cQbu9kPg
	YpUnzi1JVudZV06k4G/grYvP8T2uWR/Hn+Gk5HZUAJHXNqettHOoL5zFKYJ+MrYx5JJ/uFHrbpa2b
	udYPEWZsy62I4YOt9ug68iXb1ODNwGNvlJlRlUvoAX2WjMErT3pqEuyP/nMpVDREnFlA=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Ue-005VJk-0m
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:00 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 03/20] wifi: mt76: take the remaining wcids off the phy tx_list at reset
Date: Thu, 19 Nov 2026 13:43:35 +0100
Message-ID: <20261119124352.1842164-3-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119124352.1842164-1-nbd@nbd.name>
References: <20261119124352.1842164-1-nbd@nbd.name>
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

mt76_reset_device() runs INIT_LIST_HEAD() on each phy->tx_list while
wcids that are not in dev->wcid[] can still be on it, such as a station
between .sta_pre_rcu_remove and its removal. The later
mt76_wcid_cleanup() of such a wcid then corrupts the list.

Take the remaining wcids off the list under the tx_lock.

Fixes: 065c79df595a ("wifi: mt76: mt7915: fix list corruption after hardware restart")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index a677c05abe46..85491727dc30 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -893,7 +893,11 @@ static void mt76_reset_phy(struct mt76_phy *phy)
 	if (!phy)
 		return;
 
-	INIT_LIST_HEAD(&phy->tx_list);
+	spin_lock_bh(&phy->dev->tx_lock);
+	while (!list_empty(&phy->tx_list))
+		list_del_init(phy->tx_list.next);
+	spin_unlock_bh(&phy->dev->tx_lock);
+
 	phy->num_sta = 0;
 	phy->chanctx = NULL;
 	mt76_roc_complete(phy);
-- 
2.47.3

