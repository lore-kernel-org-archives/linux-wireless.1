Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717410;
	b=Wk70Cv5Mw4A0GhJnUnCrnDkZBGTgj6Rye3/pQE5riRksl4AnuEDwJT2iu5V3Bvd9ei+Q
	 Pe2mueQGAhKdGQKSjLzQPVz0+Dp3R7xKDpZ/7xat3fAB0z7GJJ5Wd0jK+JCUIyLbpkiFB
	 jCabu3Lv3in7VInYa7p3z739u9C2IFD5u1Ivener7hSczt7+raKHj98HzpBN0FHZx/M45
	 Ro5zp+0XKuoVb0/lSTlsBD3iKADE8AgyakE7cxEwLI5Bwy0hZyYQkpntQvhUvmf3OYdyX
	 pG6yMTsxtL4A53gK35soiumk7zwdqXe/OE66ehhPy2ADlgxT/dPpDjJdGcWOJLoqajA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717410;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mTaBbq8wmvbmmksmJRS6U8vZPPk1OWUsxuBR+CQjBrM=;
	b=mgLNxWTvk5XYyiMS4o6GLiplSIj2ZMD/WhPgFbBdUfMNEBGE/C97tnOEaZ/zuZcEeBt/
	 X65pAYBa9GyPW5aQzOVI+NnGHLbP4jnilfj7xTuhgD9gU5EP7Vuql4z6E4FvczsUIVVtl
	 8tMpjGBbdX/9nT2m8ZRPC/VTeBHui5w6ELI7H4AIPN8EuNxsl4t8N82l+Ko3Fic3uCjbk
	 iP597nMyImc6WROBWG7wMSTvx+Cfc2a1C071FSGaVOXPvud/aAbHQ0rRPD5uYB5OTznMa
	 pENJE5HjaKS/OKPV31llMXrjVXyDDFDiLC/3xOvU2dF9ccrm5HRGVBoqrQR7nZY+D+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=rQM1hA+e;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96F2606A323
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 18:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C96F2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=rQM1hA+e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mTaBbq8wmvbmmksmJRS6U8vZPPk1OWUsxuBR+CQjBrM=; b=rQM1hA+eAsMnH2wf3ZAWtma75H
	dK3IdXlr+StYCMfk5lVTKgIY93urDO1i1lPxJlfukUmrfg97lcJe7sBvtP9WZFTUFasgoeWSUJDnD
	4B4/hUgVlOJSVrcTE44Ykv4mfeR51rNdWovgBThrCu+crQISZxbRgxVliIBeJ1hJ1hDU=;
Received: from p200300cadf0358007454e6799d1561c3.dip0.t-ipconnect.de ([2003:ca:df03:5800:7454:e679:9d15:61c3] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWe7z-008icn-2n
	for linux-wireless@vger.kernel.org;
	Thu, 26 Nov 2026 19:23:27 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 01/16] wifi: mt76: keep the Null frame of an AP on its AC queue
Date: Thu, 26 Nov 2026 19:23:10 +0100
Message-ID: <20261126182325.2516607-1-nbd@nbd.name>
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

Since commit 331e766e75d2 ("wifi: mt76: route nullfunc frames to
PSD/ALTX queue"), every Null frame goes to the PSD queue, which the
drivers with MT_DRV_HW_MGMT_TXQ map to ALTX. On mt7996 the firmware does
not hold an ALTX frame for a station in power save. The inactivity poll
of hostapd thus goes on air while the station dozes, gets no ACK, and
hostapd disassociates the station.

Keep the Null frame of an AP interface on its AC queue, so that the
hardware buffers it until the station wakes. The Null frames of a
station interface stay on the PSD queue, since the PM=1 frame before an
off-channel period must leave at once.

Fixes: 331e766e75d2 ("wifi: mt76: route nullfunc frames to PSD/ALTX queue")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/tx.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index d8036466f495..1621fc3e2cfb 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -707,6 +707,19 @@ void mt76_txq_schedule(struct mt76_phy *phy, enum mt76_txq_id qid)
 }
 EXPORT_SYMBOL_GPL(mt76_txq_schedule);
 
+static bool
+mt76_tx_ps_bufferable(struct sk_buff *skb)
+{
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+	struct ieee80211_vif *vif = info->control.vif;
+
+	if (ieee80211_is_any_nullfunc(hdr->frame_control))
+		return vif && vif->type == NL80211_IFTYPE_AP;
+
+	return ieee80211_is_bufferable_mmpdu(skb);
+}
+
 static int
 mt76_txq_schedule_pending_wcid(struct mt76_phy *phy, struct mt76_wcid *wcid,
 			       struct sk_buff_head *head)
@@ -727,7 +740,7 @@ mt76_txq_schedule_pending_wcid(struct mt76_phy *phy, struct mt76_wcid *wcid,
 		    !(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) &&
 		    !ieee80211_is_data_present(hdr->frame_control) &&
 		    (!(wcid->tx_info & MT_WCID_TX_INFO_SET) ||
-		     !ieee80211_is_bufferable_mmpdu(skb) ||
+		     !mt76_tx_ps_bufferable(skb) ||
 		     ieee80211_is_deauth(hdr->frame_control) ||
 		     head == &wcid->tx_offchannel))
 			qid = MT_TXQ_PSD;
-- 
2.47.3

