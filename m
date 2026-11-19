Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092251;
	b=xBxb9mgY1GyYA3FdLUekV3Hro62t1JADkcykzTuiARgxhv8I1IfDVm959aZ2gz6Z+Bxo
	 8vF6vbkUZTlWSZkfHxCgy0444j1C67uebMv1W4QXgM755y0Q98Rq+Vw79Npz/b7Ia6GBO
	 pLZg5QtjrK5Fdp/xNnPqXAnGw2W1l2jLJkLCw8p7mlCOltjePBvZYSzzDpfGF/ak99WD6
	 ilK5UWVhzmPSDMOD7AelFIBiqVNMC7S01COOS6iq7BQ50h0rAmnwnAIx9okRi1glHeJAY
	 xzvIOPheCELHs2EBGeLuANM17yKTCa2VFx6oovPlNVRuvnLQbWcvbr9zhRrSja/rJ5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092251;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9R4Cy/mhWXsYrZ7ULrVdoQlpNVZBgl0FP65diXWYJFk=;
	b=o4X4ptCq1jQywXglJc/oa30R0LG7s8hp5VP3x6ksLRmPgphPOljwh68CnMinDjSKLY71
	 +TZHian5drEeasIMLjAJSSokQAhL7sidJ7oogLGz/FWxF7uvmyIxGdFLvpk/blelgUWaB
	 WO66g90PD6Z8pygqJ1MWyF7T/5m2q89f0eNYA8FTOAbfbTGldQJGpdhZ3lT9KLkMSOvfN
	 HpGEC2+PxrcWpW3V+jZwoataiDdquPnsxh90Ocl0fV9NFLIpGU0VqrUYKzrui4kzf5/Y3
	 lJMYJ2bZqfr/6ysq5wyPySv+eYNfdDZvNcZ3rAOwcVzO0OA/9+aUHdkbQZ3jqshXnZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="P/CQ8QCd";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1175260A2606
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1175260A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=P/CQ8QCd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9R4Cy/mhWXsYrZ7ULrVdoQlpNVZBgl0FP65diXWYJFk=; b=P/CQ8QCd2i1ir/B9t5617k5trP
	Z1HfoRQyS8o/hag3/cgmpJl+ohz4+K8Mkg6WFobAwunlZxObLtJcdHvyc9Db6ErRFGzOm+n6F99g2
	hMX9WF+UjH98QDmS38pwZet0TgvG9NmSjLT2tfglIerctrsw2TMHidxCa3quiHid6TsM=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Ud-005VJk-2u
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:43:59 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 01/20] wifi: mt76: mt7921: skip the ND offload update of a vif not in the driver
Date: Thu, 19 Nov 2026 13:43:33 +0100
Message-ID: <20261119124352.1842164-1-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
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

mac80211 also reports an IPv6 address change of a station interface
that is down, whose drv_priv ieee80211_do_stop() cleared.
mt7921_ipv6_addr_change() then queues the ND offload addresses for
bss_idx 0, which can be the BSS of another interface.

Skip the update while the interface is not added to the driver.

Fixes: 479ffee68d59 ("wifi: mt76: mt7921: fix NULL pointer access in mt7921_ipv6_addr_change")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 09574d4417cd..6207a875996c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1257,6 +1257,9 @@ static void mt7921_ipv6_addr_change(struct ieee80211_hw *hw,
 		},
 	};
 
+	if (!mvif->phy)
+		return;
+
 	read_lock_bh(&idev->lock);
 	list_for_each_entry(ifa, &idev->addr_list, if_list) {
 		if (ifa->flags & IFA_F_TENTATIVE)
-- 
2.47.3

