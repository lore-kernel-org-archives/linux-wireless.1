Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986683;
	b=uKM2e7nEsS63ApYlSLniGuxdehZG7NgGv2tXQHyWy7wnoyFfDkeFyp2MaTsQKLXynwre
	 whEdi02db1gLYJ1x6EltPGMOa4cUEeoLyVkyvY8akIDkqksEjF3FoJ4PokA7TMOlbenZH
	 aarlPK5zVqVGRq2U1t8v/0ctGJ7uIAyMAXPaJac9O8jwFo361iTaLVUSSccZzTc6Qk/Ai
	 yT+QchLC4h2+MZ95cgMCfVTzMxJNEvHhtUET7iin9F2vlc4GjjdQUrgtqMc3Z9cYibfDd
	 ebsjO5g1Vnj+5k8ESzv1hzotmhZi+odl2lfSW8RMWJy5iv4ggxOuUlEkmSscsauXucQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+/uCdGuuR5fSzXmjT42xsc7BpukorOyOL5gWzvLV+lo=;
	b=JyUWeEFoKI125bzX9fTQG2W/aQb3OGUfbPbtB7VNtj9D6W3rxxkrFXCuw785hVM9Svjz
	 2JqW6rYiw5Z3cyA18edttD/8kMEpzcwaoYLNeZtucsvXyWUaxGIgbBX5HojPiL7Op5kAl
	 3GpqeZ9HxZPwnGPDmITAEo2k6BizgOKF2MUTTHuIr9DdqZGc6VKkCk8I75buNUYEwpP8Q
	 67wyKDPgVHCEHpvk8lLtQOOAXcpsxA7UMLZn7YOwv8CjaFtj8eD2c/dqZ554m+k99qoa2
	 XdbYLW4cYlqgM8A0I+apOo5h8SIOz4D+7fKD1tM0nKTpmJ/YeYzm+uEJ4jt06iL2phA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGx5lUXU;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1D5606A336
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 07:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F1D5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGx5lUXU
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-886e61fa30fso303251b3a.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 23:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794986682; x=1795591482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/uCdGuuR5fSzXmjT42xsc7BpukorOyOL5gWzvLV+lo=;
        b=OGx5lUXUezZu16xrPmG8G+H2ILEabFtt2qff4ET48XooNO1DR7LvHJNPV7jIqT/lMY
         n7r0YT/LXNbxy9Jg1KPUCIghgQ7XLrUsTLuy6wbDGg/AP8Pdf6t1uuuzXfV7nUhp4iNB
         /APVGgsXgMZVHIDQcBQzclv5q0iFypbjj4Qyrl5ob1uPOLFDxktcq7O3KmZX/pVBEXr1
         DhUv26IOGpK7KvStdKJdqD8Oj/SPHgCJkF7vCk5E/RU5ZUvnzXUnPZZ2PiLlPaz+KbDB
         rZeTddrO9PyU+QJUVM7Wq96Ywu1irSZ1v7/54Poi6XAX9aT7SVwpvvqzsElSlG8w5Uyw
         8uIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794986682; x=1795591482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/uCdGuuR5fSzXmjT42xsc7BpukorOyOL5gWzvLV+lo=;
        b=GqemBung3ftWU17qxbhY6d6PmugZOxxIQyIlYylV9LN53neKOU4YjF9CPZ0Xxw7NwR
         kp1i7tNQlARYGHQy6M/SvK3xeVO069Z/cxEGqdPq6miFRxW8+UDGhbr5jMAnIpTWO+H7
         iBZeaolBpAaXC/4sJX2p1e2FBh3FHN8NSy1ue4D20oacw8o/BSPq+Fm1Y1zwTBM+JWKL
         /e8TaotT0f22UVaoK4+KDNDPIF5pxD8jSnbNxu2uyuvZnsZjnIKK+NNlqm0athXGt6qI
         vUxSQPwutSHLqV5wfU/GheFpguy/yjvz2SD8IJkZkge4vVIkZwqds6X7MA7U+9OODbkU
         Y8mg==
X-Gm-Message-State: APuU4Z+SSN0ldOAbNY5ojSc8CsQmyeMYxFudOxz6LK4oAGyUnVAYqpK3
	T0HyttwHwoAn65x/YG49YTdtOG1yv1HYA9ONAiUrqk+2ahu6dB9p6owd
X-Gm-Gg: AYBFou00IbDqFk8cpCHyVp04WqGMw5CXmIfxDJXCuSgtpZeHg8tpMNJ/ncMIx4Y53cy
	SgqvpG3swj1ItiKkh9nc/ShHaOZUF/Noumz5CTJrl+72/75A0mpRSyWrChoVyYnnMNDoVOqj2fi
	9mQ5k7Bf9fP5xa1tDwYMVIWCeK68irRJTAR79/b/WVLFI8gtB/1wHtMAiWuy5ONnUl/b+ebJKvD
	QLFymvYBtHJct7/MrDIDvvFXbzVpOfMvS8sHZJyjSRTJc4CMgLhFOGrGPU1pyFB/z78i5LamM9D
	qVlIB1u0kcb2ogNqPGnKpz78VXHZUwHpvCdGgEgU/OryKpkw3ytXJXAyLXsUmPksGEPwb76whQX
	lHr3EXfip5Im17nfxx18+ebflyzsScZLs6AwW75cydwyq3bWFJkCUR6y8U0FuGY5Bk7CE/L3Cpy
	47YJ2Nak9pSmRepZJlYwdE812487RjlSYwR+JkkBejy76JVlCZPbuZisq7CrFp8xTLHyhyNC2di
	mPp3/T0EeHjJwyWmrDz1SWlTkeElr6ApZIcpBLicgXesw/ejFvqlw5KHbVzP0BHG+GPaUBOILYW
	nDELbfzVh5uPbcTdMOhr2S9q266wlKZPT4livmj+cKdvmB7xze7nnOXZUgjwyD5qARUGnJRVcHp
	insZYNtKM4iDp/hLiomvxn3bThFtAeNByLFnPJs/3
X-Received: by 2002:a05:6a00:2e16:b0:8b1:d612:e945 with SMTP id d2e1a72fcca58-8c5d48d7617mr1382905b3a.52.1794986681813;
        Tue, 17 Nov 2026 23:24:41 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa75esm694190b3a.15.2026.11.17.23.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:24:41 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvalo@kernel.org,
	quic_nmaran@quicinc.com,
	quic_hprem@quicinc.com
Subject: [PATCH] wifi: ath11k: stop the RX paths before tearing down the peer TIDs
Date: Wed, 18 Nov 2026 15:24:33 +0800
Message-Id: <20261118072433.1259877-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

ath11k_dp_peer_cleanup() clears peer->dp_setup_done only after
ath11k_peer_rx_tid_cleanup() has returned, but that cleanup gives up
base_lock around every timer_delete_sync() call.  A fragment that
arrives during one of those windows still sees dp_setup_done set, so it
passes the check ath11k_dp_rx_frag_h_mpdu() makes under base_lock and
goes on to use the rx_tid whose REO entry has just been deleted and
whose fragment queue has just been purged.

Clear the flag first, while base_lock is still held, so an RX path that
runs during the cleanup takes the -ENOENT branch instead of touching
TID state that is being torn down.

ath11k_mac_peer_cleanup_all() walks every peer under base_lock and calls
the same cleanup before freeing the peer; clear the flag there as well
for the same reason.

The RX path has the mirror image of the problem: it drops base_lock
around its own timer_delete_sync() after it has already queued msdu into
rx_tid->rx_frags, and the teardown can purge that queue and free the
peer in that window, so neither the rx_tid pointer nor the ownership of
msdu can be proven afterwards.  The fragment timer callback takes
base_lock itself, so the lock does not have to be dropped at all:
delete the timer with timer_delete() while it is held, which keeps the
whole check-and-reassemble sequence atomic and leaves msdu owned here.

Deleting the timer is not enough on its own, because timer_delete() does
not wait for a callback that has already started and is blocked on
base_lock.  That callback would later run
ath11k_dp_rx_frags_cleanup() against whatever sequence is queued by
then.  Track the armed timeout per TID, clear it whenever the fragments
are cleaned, and let the callback clean up only once the deadline it was
armed for has passed, so a stale callback cannot drop the fragments of a
newer sequence.

The per-TID timeout state is initialised together with the fragment
queue, so the first callback after a peer is set up again cannot act on
values left behind by its previous incarnation.

Fixes: a06bfb3c9f69 ("wifi: ath11k: Ignore frags from uninitialized peer in dp.")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Prepared against v7.4-rc1-1969-g666539eecdf4.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.

Testing: compile tested only (arm64, gcc 11.4).  No ath11k hardware was
available, so the race was not run.
 drivers/net/wireless/ath/ath11k/dp.c    |  8 +++-
 drivers/net/wireless/ath/ath11k/dp.h    |  2 +
 drivers/net/wireless/ath/ath11k/dp_rx.c | 50 ++++++++++++++++++-------
 drivers/net/wireless/ath/ath11k/mac.c   |  1 +
 4 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index be65d73b904b..c1ec35262bd1 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -35,8 +35,14 @@ void ath11k_dp_peer_cleanup(struct ath11k *ar, int vdev_id, const u8 *addr)
 		return;
 	}
 
-	ath11k_peer_rx_tid_cleanup(ar, peer);
+	/*
+	 * Stop the RX paths before tearing the TIDs down.  The TID cleanup
+	 * drops base_lock around timer_delete_sync(), and a fragment that
+	 * arrives in that window would otherwise still see dp_setup_done set
+	 * and go on to use an rx_tid that is being cleaned up.
+	 */
 	peer->dp_setup_done = false;
+	ath11k_peer_rx_tid_cleanup(ar, peer);
 	spin_unlock_bh(&ab->base_lock);
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 84f66839f0c6..d343f8e6df23 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -35,6 +35,8 @@ struct dp_rx_tid {
 
 	/* Timer info related to fragments */
 	struct timer_list frag_timer;
+	bool frag_timeout_armed;
+	unsigned long frag_deadline;
 	struct ath11k_base *ab;
 	u32 *vaddr_unaligned;
 	dma_addr_t paddr_unaligned;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..37fc116c4996 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -886,6 +886,13 @@ static void ath11k_dp_rx_frags_cleanup(struct dp_rx_tid *rx_tid, bool rel_link_d
 
 	lockdep_assert_held(&ab->base_lock);
 
+	/*
+	 * Whoever cleans the fragments also cancels the sequence that was
+	 * waiting for the timeout, so a callback that already started for it
+	 * has to stay out.
+	 */
+	rx_tid->frag_timeout_armed = false;
+
 	if (rx_tid->dst_ring_desc) {
 		if (rel_link_desc)
 			ath11k_dp_rx_link_desc_return(ab, (u32 *)rx_tid->dst_ring_desc,
@@ -3204,12 +3211,24 @@ static void ath11k_dp_rx_frag_timer(struct timer_list *timer)
 						      frag_timer);
 
 	spin_lock_bh(&rx_tid->ab->base_lock);
+
+	/*
+	 * This callback can have been started for an older fragment sequence
+	 * and only get the lock after a newer one has queued its fragments
+	 * and armed its own timeout.  Only clean up once the timeout of the
+	 * sequence that is currently queued has expired.
+	 */
+	if (!rx_tid->frag_timeout_armed ||
+	    time_before(jiffies, rx_tid->frag_deadline))
+		goto out_unlock;
+
 	if (rx_tid->last_frag_no &&
-	    rx_tid->rx_frag_bitmap == GENMASK(rx_tid->last_frag_no, 0)) {
-		spin_unlock_bh(&rx_tid->ab->base_lock);
-		return;
-	}
+	    rx_tid->rx_frag_bitmap == GENMASK(rx_tid->last_frag_no, 0))
+		goto out_unlock;
+
 	ath11k_dp_rx_frags_cleanup(rx_tid, true);
+
+out_unlock:
 	spin_unlock_bh(&rx_tid->ab->base_lock);
 }
 
@@ -3238,6 +3257,8 @@ int ath11k_peer_rx_frag_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id
 		rx_tid = &peer->rx_tid[i];
 		rx_tid->ab = ab;
 		timer_setup(&rx_tid->frag_timer, ath11k_dp_rx_frag_timer, 0);
+		rx_tid->frag_timeout_armed = false;
+		rx_tid->frag_deadline = 0;
 		skb_queue_head_init(&rx_tid->rx_frags);
 	}
 
@@ -3698,18 +3719,21 @@ static int ath11k_dp_rx_frag_h_mpdu(struct ath11k *ar,
 
 	if (!rx_tid->last_frag_no ||
 	    rx_tid->rx_frag_bitmap != GENMASK(rx_tid->last_frag_no, 0)) {
-		mod_timer(&rx_tid->frag_timer, jiffies +
-					       ATH11K_DP_RX_FRAGMENT_TIMEOUT_MS);
+		rx_tid->frag_timeout_armed = true;
+		rx_tid->frag_deadline = jiffies +
+					ATH11K_DP_RX_FRAGMENT_TIMEOUT_MS;
+		mod_timer(&rx_tid->frag_timer, rx_tid->frag_deadline);
 		goto out_unlock;
 	}
 
-	spin_unlock_bh(&ab->base_lock);
-	timer_delete_sync(&rx_tid->frag_timer);
-	spin_lock_bh(&ab->base_lock);
-
-	peer = ath11k_peer_find_by_id(ab, peer_id);
-	if (!peer)
-		goto err_frags_cleanup;
+	/*
+	 * The timer callback takes base_lock itself, so it cannot run while
+	 * the lock is held and deleting the timer here is enough.  Waiting
+	 * for it with timer_delete_sync() would require dropping the lock,
+	 * which lets the peer teardown free rx_tid while this path still
+	 * uses it.
+	 */
+	timer_delete(&rx_tid->frag_timer);
 
 	if (!ath11k_dp_rx_h_defrag_validate_incr_pn(ar, rx_tid))
 		goto err_frags_cleanup;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d..4bdc9afbc3c1 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -899,6 +899,7 @@ void ath11k_mac_peer_cleanup_all(struct ath11k *ar)
 	mutex_lock(&ab->tbl_mtx_lock);
 	spin_lock_bh(&ab->base_lock);
 	list_for_each_entry_safe(peer, tmp, &ab->peers, list) {
+		peer->dp_setup_done = false;
 		ath11k_peer_rx_tid_cleanup(ar, peer);
 		ath11k_peer_rhash_delete(ab, peer);
 		ath11k_mac_station_cleanup(peer->sta);
-- 
2.34.1

