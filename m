Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196708;
	b=MgvdfvaV+jhdx+XwkVBkYwMYRgKI9Qdrtj+TNMP3ZxxwNBigtAGi/0N+HsWqfxwJ7Khp
	 Q1llSULyChQaNzvvExsdpJRDqXIOWqHLxVM1dABWnUmHKAmNo9G8Tw5xpbz+BWxu11R/+
	 BfjnFuBCr1XQUM/ngf/nZbqo2Q1nuAv5xajbWf4ooQqd7FV7NWcQKtYXus9zONcg0S1Mh
	 8H/MSm/f1rIz0/6zgUjmyFoUsquM68h1VJvXhtmnyQ6rRSyeDCun5d0mKju/3C9mdIIK2
	 cOhVbY1ifnUlBXcjfdPoSHYlEX0JW0iCuLwM5DToI5MZIKh8CAPnk4rrUiDzHC3lI4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196708;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=y3UF/F8sj8CeFEVpzyKl6nNQj8KUFbQdoSB/J0PzCQw=;
	b=JJ4MQ9vgm0bcy72oR8OD3qzdHHb2auj01rwYu3r6vV4wfFT8prmIiJ1pihHa4rhP/Xl3
	 3CuKizpxP70vMuWm7PM/J4+LxTqVHaLa/5EFbJQKpHtHAuFs0vqi8r/OjMo63NCKLB8OG
	 5cwgNg5/W196zJixmjGcXx9pdnKlRrT8RIln3Kuhga7Qb1aYakjqwU/hap5HWCdJEnyMK
	 yoEKy7B4MQF1EKlp9a3U2RPWHCSglKvkVGk5H4M6+CduHTfWLFsxKHLj9dHPkWOHD4lW1
	 f9ITEJ7St38GRiX/s914s/4Kzuq4JNjYAeDkYbUp2jOI+GwOnmfgExSydS/KMWw59oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=KpGtQ9fu;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8037160A261E
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8037160A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=KpGtQ9fu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=y3UF/F8sj8CeFEVpzyKl6nNQj8KUFbQdoSB/J0PzCQw=; b=KpGtQ9fuvtQWItD7IpkvNibG8X
	VuW1Ak7dh1Qza9d0COxkGtR2sQJQcQ0V5dij+GQYAqriuso83ivf8sgcrJTxUe3zPJt4sXRDm47AF
	fSOt+qzntGTFr7rfKuWSRdBo7Ka/I0QTvY/B8P3j6q3p0mZxxN+7and4KN4+xUcP9LdE=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfX-0065GI-24
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:03 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 01/20] wifi: mt76: mt7925: free the vif links when all links go
Date: Fri, 20 Nov 2026 18:44:40 +0100
Message-ID: <20261120174459.1657382-1-nbd@nbd.name>
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

mac80211 clears vif->valid_links before it calls drv_change_vif_links()
to remove all links of an interface. For an interface without valid
links, mt792x_vif_to_link() and mt792x_sta_to_link() return the
embedded default link, so mt7925_change_vif_links() takes every removed
link for the default link. The other links thus leak at each
disassociation of an MLO station that has an active link other than
the default link.

Look the removed links up in the link arrays of the driver, which do
not depend on vif->valid_links.

Fixes: 69acd6d910b0 ("wifi: mt76: mt7925: add mt7925_change_vif_links")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index d7b359930b3c..d892434de54c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2496,8 +2496,8 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	mt792x_mutex_acquire(dev);
 
 	for_each_set_bit(link_id, &rem, IEEE80211_MLD_MAX_NUM_LINKS) {
-		mconf = mt792x_vif_to_link(mvif, link_id);
-		mlink = mt792x_sta_to_link(&mvif->sta, link_id);
+		mconf = mt76_dereference(mvif->link_conf[link_id], &dev->mt76);
+		mlink = mt76_dereference(mvif->sta.link[link_id], &dev->mt76);
 
 		if (!mconf || !mlink)
 			continue;
-- 
2.47.3

