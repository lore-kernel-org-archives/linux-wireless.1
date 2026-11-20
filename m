Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196707;
	b=B+/eRSMfKtKKf7McD7oWl6BxiLbOZ2Z2ZibjBlA5xYZVB6OO757iQi/y/1yo1wwX31br
	 ARNnU2kVpMG/fRF/iFUVv5iSV5TnoUaT6CNWh/ydQwQsH1yBIB3Vbj2IGML6DiKZWfUKv
	 20Ff+8HPFJ88lSPky7pcjOgFyLTqLqvZcY8BVNT7mgRnHPp+lDS9tizvkhzNQ/hr/gwSX
	 81sXF2ywGYxNsub/PZj4StylU82JOcvDgLB/sDmJmAmLUDAUk9wmcNjneSZ8+nJuXiwur
	 Nusp9nxBYwXjlnMKZwztiPZY4yfikI/l5OijcwCtRU1MbZKMOOIHtxRS6rmPwmG8liw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196707;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0CeKmFmseeuL4DWyrrjpH8PTnBsSMp5T60rCRLxBE8E=;
	b=mEmawRfN7Z7mUma4H9VOwICvMhdm2uoAEykoThbKAlpDTRHNC+cSbjSgZUl90XDv43xQ
	 PAxoI5+AESl05EJ1dvfzdRdL5upa7AkOvGuRP95t9XwFcdTIJh6xU0vlqMuIaMX3sB4IR
	 CDrjhJlafIs3XOAAqHrNvTzqPS9GPeZ8Z/VfQBP8MFYOnZyiCJLdupDTYRTD8b1uxFXIJ
	 ZHznPqZJqTqMDSzskfW5CHQxWxprhDSqESrCrcDEhPJSDwCh7ziu9AuZm70CyXpv2H7X5
	 uIR+VMffKQcNT+yxxU3w5jpPrh09haGT4FEdsPopJ8DkuMO6xurt29V+ssk3HXYhMkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=dv6SuiIJ;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0EF60A2630
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF0EF60A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=dv6SuiIJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0CeKmFmseeuL4DWyrrjpH8PTnBsSMp5T60rCRLxBE8E=; b=dv6SuiIJKb9KIqRTyVG1lXiKz8
	m6L2FA9C5SEvrcog6QvrKHkyeeaZ/RioGaLWw2r9kHNLZDlkYKqhJ5li/ho7oih96hMNB1oiaXzqH
	THjcx6DVoT5cwyUtO8Led6DertQf2Vi5qts6dIxZnDxcpgFiEhgmsl1hdk51zpLbyca0=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfZ-0065GI-1H
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:05 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 11/20] wifi: mt76: mt7925: keep the default link in the active links
Date: Fri, 20 Nov 2026 18:44:50 +0100
Message-ID: <20261120174459.1657382-11-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120174459.1657382-1-nbd@nbd.name>
References: <20261120174459.1657382-1-nbd@nbd.name>
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

Since commit 43aa4033eb18 ("wifi: mt76: mt7925: add
mt7925_change_sta_links"), the driver removes the default link of an
associated AP MLD, the association link, when mac80211 deactivates it.
No other link takes its place, so the interface sends no data on the
links that stay active. Reachable via an advertised TID-to-link mapping
or an ML reconfiguration of the AP MLD.

Refuse an active link set without the default link while an MLD
interface is associated. A move of the default link does not help,
because the firmware sends the uplink of an MLD only on its association
link. Where an advertised mapping or an ML reconfiguration of the AP MLD
leaves that link out, mac80211 now disconnects instead.

Fixes: 43aa4033eb18 ("wifi: mt76: mt7925: add mt7925_change_sta_links")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index d3b1f5e7850b..f8ad3bd16931 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2715,6 +2715,18 @@ mt7925_change_sta_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return err;
 }
 
+static bool
+mt7925_can_activate_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			  u16 active_links)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+
+	if (!ieee80211_vif_is_mld(vif) || !vif->cfg.assoc)
+		return true;
+
+	return active_links & BIT(mvif->deflink_id);
+}
+
 static int
 mt7927_reconfig_band(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		     struct ieee80211_bss_conf *link_conf,
@@ -3148,6 +3160,7 @@ const struct ieee80211_ops mt7925_ops = {
 	.mgd_complete_tx = mt7925_mgd_complete_tx,
 	.vif_cfg_changed = mt7925_vif_cfg_changed,
 	.link_info_changed = mt7925_link_info_changed,
+	.can_activate_links = mt7925_can_activate_links,
 	.change_vif_links = mt7925_change_vif_links,
 	.change_sta_links = mt7925_change_sta_links,
 	.rfkill_poll = mt7925_rfkill_poll,
-- 
2.47.3

