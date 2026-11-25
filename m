Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628188;
	b=LcHKi1pxZ2Z0G+dN3ycnLfG6LuSES/1s4JIG44OlddozQG7SljbW0qVxbuF8Bee+Ge21
	 9IbjLXCsXYVhs1tyuC6hgtY8DkqR+Lu2zz4EXL+mXsncVnjwogPBHX7tyHwaMBEbULHOd
	 JSrKm7JHD41gxMvJr+67Uf6Wg11wAhNZrix2PIJxrVirElLeveGaioxS+63IYf8l5DLqj
	 kKovPGA2uz01ry843PENUoy6wLoEvbTJvaGAPDIKKCW5oSlN6t6dy9QNSYM7c4O29mfhx
	 PqmgjNfFIAXp0579co4llrVPolHD/il0rJPz0t6vZSpba4TbOtkQZIatUAjD1f/g+DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628188;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MpdYxPUqarJIM0gKdsS5sccpE3DwL95zW2B3bvH1SDw=;
	b=eGp2zMI8JSvDS21tCeBER6AJjnvmousAmL2xaJ77dvpGxap5KJ/ZqOcTRNfmCaqh8Y0R
	 ggPkRDpCsnPBNZyu7vXdwFlVRQql39FUvpG8Weah5HQIoJmqd0g516KEZcwhsOOwdBcUW
	 XBKttV7ZD5Lf86aiw9KZ5D9TeBpQzHLQxFJZs4XMMQEiRjV03or8rpc8p+uRzER266ND5
	 o2JkPjh7z03UBdQ3wbCtt0yuOPm5Qx2fEmCdGEy4xgv5j4fd+MWWaYAZLuD30/c/ekZQK
	 k2jNJLPlxD4TkKsWVwew5qf/t9e23qA2zxVerwe+rRfdaydgva/eIYhYSI77TprHiQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=m+EhHKKr;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F41606A327
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26F41606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=m+EhHKKr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=MpdYxPUqarJIM0gKdsS5sccpE3DwL95zW2B3bvH1SDw=; b=m+EhHKKrt1e7lPcGSOSRYyIfe9
	Dvw3DD1uG+5u/qoczul/l4/CJ5WZmYN9W+wbVrr1cYYdMYuruFEXqBAVEs9P1HCVD20GtNPGYWFIh
	LPA4mxNmTKz0epie/C5P7eUk44Y02zdUi1D7mL+Ka4+yrY5w54Lns0MF+klp78N+g8Us=;
Received: from p200300cadf00a300521515e4a5376631.dip0.t-ipconnect.de ([2003:ca:df00:a300:5215:15e4:a537:6631] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWGuv-008IWP-1y
	for linux-wireless@vger.kernel.org;
	Wed, 25 Nov 2026 18:36:25 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 03/18] wifi: mt76: mt7996: take the phy of a fixed rate from the station link
Date: Wed, 25 Nov 2026 18:36:01 +0100
Message-ID: <20261125173616.3776951-3-nbd@nbd.name>
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

mt7996_link_sta_fixed_rate_set() dereferenced the phy of link 0, which
is NULL on an MLD that never had link 0. Commit 5806c91a3f0d ("wifi:
mt76: mt7996: Remove unnecessary phy filed in mt7996_vif_link struct")
made it a refusal. Since then, an AP MLD that removed its link 0
refuses the fixed rate of each station link.

Take the phy of the interface link that the station link belongs to,
like mt7996_sta_hw_queue_read() does. The write is then refused only
where that link has no channel context.

Fixes: feb06d455620 ("wifi: mt76: mt7996: support fixed rate for link station")
Fixes: 5806c91a3f0d ("wifi: mt76: mt7996: Remove unnecessary phy filed in mt7996_vif_link struct")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
index 2ca594618f3b..7c976ec20d10 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
@@ -1035,14 +1035,23 @@ static ssize_t mt7996_link_sta_fixed_rate_set(struct file *file,
 #define LONG_PREAMBLE 1
 	struct ieee80211_link_sta *link_sta = file->private_data;
 	struct mt7996_sta *msta = (struct mt7996_sta *)link_sta->sta->drv_priv;
-	struct mt7996_phy *link_phy = mt7996_vif_link_phy(&msta->vif->deflink);
 	struct mt7996_sta_link *msta_link;
+	struct mt7996_phy *link_phy = NULL;
+	struct mt76_vif_link *mlink;
 	struct ra_rate phy = {};
 	struct mt7996_dev *dev;
 	char buf[100];
 	int ret;
 	u16 gi, ltf;
 
+	rcu_read_lock();
+	mlink = rcu_dereference(msta->vif->mt76.link[link_sta->link_id]);
+	if (mlink)
+		link_phy = mt7996_vif_link_phy(container_of(mlink,
+							    struct mt7996_vif_link,
+							    mt76));
+	rcu_read_unlock();
+
 	if (!link_phy)
 		return -EINVAL;
 
-- 
2.47.3

