Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871185;
	b=d/50h/5SBadW2NAMTQpLKIBhGWAwRtMmCSF01yw8wkf0gpnsdAqEsUNraBWUWzZSIKxX
	 sqQA9YPMp4lJercTmsIUINPQt6Nqx4oHVNXDVlDv96gBTUnWdrNvNQACg3aPx8qXxWywn
	 0G7Zlrddy8VJQVQ50AMUgvbruGd30XAxYDYiBEBXX31FXRFjXK81/5QEOSQ21MbNutmhf
	 u2Q+rReQcPFAhtz29ESahfRNx0TsZPOPW7RmzzXBY0R8IJb5YPetHyH/EPQWn/FZrcszU
	 ewmonJbwPXRqB/bgoLtjYrZENX3IAVTVi6nQGa+osVXG8EeybTtiholznzUtjldSGhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871185;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ovr1vQdfY8B1hnPOa0U9HTNe54gtsAljzjaukZV1nY8=;
	b=PhkJwWNiElCy2KVOP9lc0HgW5zFzo8KTp75FNnMx2BKeYggZxcKPozkHrlpl71mqWe5k
	 0Kt+BNwQhT4A1vlXdrUrhhX/B1fDWLKQyeqaRKhOdoXu5sgbDrLk46MYGuvJv0u4v1/gv
	 AzN6Scl2/8jXT/SBjdH+ScjRGfik7UDg6zrPfBya/hr8dOmwas6p7X/GuskCN+A7oZoPL
	 hPPMn8x8Nep7Vn9GhPCQP1cOwCBbQeImxzvu6i299RkL37P9u8v3WPhaGouUvcaHuPPNY
	 e1boMMT3VfO44mJlYlhTvb2GMFXymNC7sE6aaJNpze6d1v4r+lzsYQWk0D2m3fs8Jaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D73606A330
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90D73606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-43bf9548df4so5363851fac.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:19:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871184; x=1795475984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ovr1vQdfY8B1hnPOa0U9HTNe54gtsAljzjaukZV1nY8=;
        b=BMqm5TvM/moHIjc4sgRNQ/r/OaXzEtVKo/VlWqDJT2kiCFKggr8Rtp6Y76njmJJgpM
         E9q/PfWygC70ozdkpPp8azkNI1LmBo6I/sT3KbVtVMqtRi5BfuQKvN7LiuXvl2Gy1MqV
         jtJQ6O9XXwYBi3VVFzdM7keFKE4V9KXC0O9d7GPJlplF52YrJ0RS96To8rJWwGTPHHOG
         FCroqn3nz6uJ6mDzxtFdpbxzeQgIlXfZpouBh0+W73GtCRCLeQVw5djpWFlMDce1t6pQ
         Urt4vl6wvwh2ViPyycCKPlyz30eG2Kk9UdUevUGGVxYn4DA5arJ/sMpFmdtZU0hRHzn2
         T3bA==
X-Forwarded-Encrypted: i=1; AL+hErEHnNLOAVjx/AjRyqzPlH5VRWw0gfcJaMYzdUkxO7Q1p9xC9pjUJAPEiX+lJ6bxwywZdoj3q/6EqjjeM8FgOQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z95KkM2HtnTteQ6XXfgwSaHydV4Vyj64BWNPljtjd2sju329ZrY
	Tlc+wGsGocI0u66oUymIHqQnCinN9PWorv7Z/TN8KK5PxetJBCoabYy2WZFS/A==
X-Gm-Gg: AYBFou1fqsdQo3l0stU/5ce8YmknzEOGq+vl47wJNFWrGBDvKqdXVTapsAeBqY6BjXY
	TrznUbZ94HVZbAH6XG1LxDVLrUxc5kRlz5E+SdnrLgj6P+ioKKsHNS/TyrO6GtLn2VOhyjMMfwA
	i1XQC9h8zOub04+nlM60ecYCq/7fuBd/Qm48fDm+C8zQ1bOCqRHtzH5I42vzsPkAuX24sV9/lbY
	bINshu9iqnHtGrLbVDu+rEb22C1VuVd9xbKnAd8035HWLqr+2B6Qhat4nivNilTp4Hvq2sqiEaz
	XrLKLFkOpqBiXiItlPobmgpgIyuU0qDTlDYbNNTO9z0guko2HKWtFibAYOFSMIR/YyZychiemJK
	gMWbbb8V+0gIo0X2ARh+0Q73wl2BZU/O8orVMioUEB1ZOxd071aUYNwePqsb4lv28sTmBGvW5Qw
	34FQVaD4t3U61qspD6a09bBvVQwyjQq021g/HS3qm++48OE5RdELSgQJXceOaYbJ2ZOUrUm26+J
	24SeaWDkfCFyKMvyPJUSSwM4bB07WvvaJX8Ltouk15Uf5y5vbtX+ad+rN8ig9TrjwcKPyUWu5U5
	T+RfRNrR2Yhe2D7eVLy7Munm3TvzQ672CiuRJNCvs8usYjm/owcgR0mBc46Am6dWa+alfvLsSAI
	m28Y6X+rW0Sz47840aLHkFuqHn1mgtTU=
X-Received: by 2002:a05:6808:10cf:b0:563:e8b6:c5d5 with SMTP id 5614622812f47-56e64cf4cb6mr11277026b6e.44.1794871184505;
        Mon, 16 Nov 2026 15:19:44 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:44 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 13/19] wifi: mt76: mt7925: defer the NAN joined-cluster event out of NAN_START
Date: Mon, 16 Nov 2026 17:16:24 -0600
Message-ID: <20261116231630.1733906-14-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
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

From: Jacobs Wu <jacobs.wu@mediatek.com>

The firmware can join an existing cluster from inside the passive scan it
runs at the start of NAN_START, so NAN_EVENT_ID_JOINED_CLUSTER lands while
the start path is still executing and ieee80211_vif_nan_started() is not
true yet. The handler dropped the event with a warning, leaving userspace
unaware of the cluster it had joined, and service discovery then never
completed: measured 4 failures in 12 NDP bring-ups on an MT7925 pair, each
one accompanied by exactly one dropped event on the joining side and none
on the side that created the cluster.

NAN_EVENT_ID_STARTED_CLUSTER already defers past NAN_START through
nan_deferred_work for the same reason; JOINED_CLUSTER is the other exit of
the same firmware warm-up branch and needs the same treatment. Queue it on
that work with its own cluster id, so a started and a joined event pending
at once cannot overwrite each other.

Fixes: a5487a682406 ("wifi: mt76: mt7925: add NAN MCU helpers")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 20 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7925/nan.h   |  1 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  1 +
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 2d6760c50fc5..0fe8ae6c0d26 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -706,8 +706,20 @@ mt7925_nan_mcu_handle_de_event(struct mt792x_dev *dev, struct tlv *tlv)
 		return;
 	}
 
+	/* JOINED_CLUSTER has the same race as STARTED_CLUSTER above: the
+	 * firmware joins an existing cluster from inside its start-up passive
+	 * scan, so the event can land while NAN_START is still running and
+	 * nan.started is not set yet. Defer it the same way instead of
+	 * dropping it - a lost join leaves userspace unaware of the cluster it
+	 * is in and service discovery never completes.
+	 */
 	if (!dev->nan_vif || !ieee80211_vif_nan_started(dev->nan_vif)) {
-		dev_warn(dev->mt76.dev, "nan: joined-cluster event but NAN not started\n");
+		spin_lock_bh(&dev->nan_deferred_lock);
+		memcpy(dev->nan_joined_cluster_id, cluster_id, ETH_ALEN);
+		set_bit(MT7925_NAN_DEFERRED_JOINED_CLUSTER,
+			&dev->nan_deferred_pending);
+		spin_unlock_bh(&dev->nan_deferred_lock);
+		ieee80211_queue_work(dev->mt76.hw, &dev->nan_deferred_work);
 		return;
 	}
 
@@ -729,6 +741,7 @@ mt7925_nan_deferred_work(struct work_struct *work)
 {
 	struct mt792x_dev *dev = container_of(work, struct mt792x_dev,
 					      nan_deferred_work);
+	u8 joined_cluster_id[ETH_ALEN];
 	struct ieee80211_vif *vif;
 	unsigned long pending;
 	u8 cluster_id[ETH_ALEN];
@@ -737,6 +750,7 @@ mt7925_nan_deferred_work(struct work_struct *work)
 	pending = dev->nan_deferred_pending;
 	dev->nan_deferred_pending = 0;
 	memcpy(cluster_id, dev->nan_started_cluster_id, ETH_ALEN);
+	memcpy(joined_cluster_id, dev->nan_joined_cluster_id, ETH_ALEN);
 	spin_unlock_bh(&dev->nan_deferred_lock);
 
 	if (!pending)
@@ -750,6 +764,10 @@ mt7925_nan_deferred_work(struct work_struct *work)
 	if (test_bit(MT7925_NAN_DEFERRED_STARTED_CLUSTER, &pending))
 		ieee80211_nan_cluster_joined(vif, cluster_id, true, GFP_KERNEL);
 
+	if (test_bit(MT7925_NAN_DEFERRED_JOINED_CLUSTER, &pending))
+		ieee80211_nan_cluster_joined(vif, joined_cluster_id, false,
+					     GFP_KERNEL);
+
 	if (test_bit(MT7925_NAN_DEFERRED_SCHED_UPDATE_DONE, &pending))
 		ieee80211_nan_sched_update_done(vif);
 out:
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index 165cf21b787b..94d8d4bc445e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -144,6 +144,7 @@ enum mt7925_nan_key_type {
  */
 enum mt7925_nan_deferred_event {
 	MT7925_NAN_DEFERRED_STARTED_CLUSTER,
+	MT7925_NAN_DEFERRED_JOINED_CLUSTER,
 	MT7925_NAN_DEFERRED_SCHED_UPDATE_DONE,
 };
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 78901585d784..c46b88467193 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -424,6 +424,7 @@ struct mt792x_dev {
 	spinlock_t nan_deferred_lock;
 	unsigned long nan_deferred_pending;
 	u8 nan_started_cluster_id[ETH_ALEN];
+	u8 nan_joined_cluster_id[ETH_ALEN];
 
 	struct {
 		void *va;
-- 
2.43.0

