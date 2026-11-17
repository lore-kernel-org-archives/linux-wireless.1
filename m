Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927278;
	b=Y3dVSjh5r0qwmfUxC3HNHhd4FhRK9W9Lx2kFnJMJ/xgCCGprTOnqpIGnZpWO6Gd+1+Xm
	 RQU0KQvcwXozMf2Q0Jx8tfZkR60cUn1v8Qp3+uTXyrx8tAjzlIHQFhcTozFo1Dyijii8s
	 FM8OvDzgylvNcHfAK6q0DUG5CFqMjU2sOprLs9Ce8e14Wfqn0KgSKIXFeIkoKEstb8LRq
	 p1xFNrfAVNzLi6Kc3b9+NwSPPmt9W3U4Fnne31wU0oXQXN3eM1euTBUGiSzHbaEC0Ny8L
	 dO4qjTH9yKmECRuQXsluyL2fV8GH2sD1nu+Y+sxkSJp78nljXRtw6ttyY9pr8GTHswQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IP0GW2wit1DG5jrtVXntkzGkK3XObCmCGO6fI5J3Kv0=;
	b=uIWimX4uhx8CrcIbi5u5pUtkLpVGUG/GMElk5LcEUbSRbixSHZ7QxgUV1sstnOb7Gu5d
	 VP74Znjc27VTJPX6SSj6U6cLFYF6pelgZokGcwNJGGwarBr1LWIThG2jkmDGaiQBZSKHJ
	 UWfUvo7Nz0uzK8f+3y615c1wkRBPviwH9sOa03mPBy9DKUe3hMh1HafruyOp5nyuVNtJk
	 lomdzeHqqT5by3tSR6PpmgSldAU148Jht67C9u1X6B3f25gCWQRhmvFOKW2wYfgRuZN4P
	 xG4iNtUqDx9mkbZqFYjZ5Roi/CXkH6imBVGegDQP/4TDwG7KZYvHZNwFgjwRTdZKQuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hRQwcyj2;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0555F606A886
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 14:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0555F606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hRQwcyj2
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so2641588b3a.2
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 06:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794927277; x=1795532077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IP0GW2wit1DG5jrtVXntkzGkK3XObCmCGO6fI5J3Kv0=;
        b=hRQwcyj2v1rQpVKBYfY/y/BWv/PI6B8tEiCv1+Wjf2Z1fWLdQmPwXREO6K3AaoYMLu
         drOxsG6bVfatEdY+WL6yX+tUPvawfhoPyGkELPNGE623C/i6W6h5T1tBF3W6sKzrc/jN
         SvXZasm/pJBI6kzZu11rHTxVVrrDAnkxo0ipYXragZVr9WjUHaYItZ9/z4ngE8zr1pKT
         z/PEqeowdcTicOJkuEA3Xq0sp1CnVgNwfOWQaOgP2tpp94/jB4id+GaiSqN7j6a1TIVe
         TepTCzMpt7DoIq2B5ck5f9S/xxjvlAV+b/ItqD1Me1wZdtZgquWf4bB6pWpFnKG7efcD
         r7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927277; x=1795532077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IP0GW2wit1DG5jrtVXntkzGkK3XObCmCGO6fI5J3Kv0=;
        b=NHrek1IiywpUGha4v/njr225N4/UXdmj+QDAquOnuNQcluudDqBYQXaZ6xejEU40tw
         ijfiqpfoC8zuF+qoC11inlHc5qVJw8S64c5UMDzoSegqEeKOwDwe2snDLFdJZEBP7SD7
         agOC0DpzxvOrYFcG5H/Z3uijhoxBHIr+EkvhFXbDdxakZfaWqc0sBsz6xah0zqc/rd71
         aplYB2goGdn23vx03WdNdhJ3CYdqJIGtCys2B2P0BDXQFXJxjQ4jS/iQbfKfa+1CoI3X
         TeYgScp1a8N6PkfljIsLG+YJZBrqmJPkBf9cVQNIu3FD064NTwjro25uYiMJ5sL5SU7C
         rABQ==
X-Gm-Message-State: APuU4Z9M4PTtJm2luG6mPVnIwP3NiJGhowzqh7M2J2WA26ZsUwp4LXMT
	qn3MKArGkXkK3Lzjo6QDdBu6WEI/g+aiX+EeHA/AdJXO2DSXtKJcZErvrU6dWryxbsA=
X-Gm-Gg: AYBFou0BKlC2NDQFtwULASYTA06iAqh+Sss/l3B0ahIoksNuq89lqIwd3pe1oKRqsQD
	4pUSzTvpCr+I84H2sqgHz/bdG7VYI904TS4F++lkauQWImG4U6MNK4j+nw3WLUH4JYMmXbj89pH
	BwR8lT1x+PZ821af3Gc7CE8yKl/bOLGfIBk59ucocDvLh2HO0pMOdmJCExYIVy4aly11npY7jbO
	gJfWXyfRE8pstj1q1GaPuOYrjKhpAgfXIdlS6jx4HXBuzg5Cxw7nT/Qorz55KRykU9nfoy4yX9o
	y9dVTjl4ei1K7ErUN2B4Hxkhob8XCkWXsgFV1kx1gBLLJZBe9MLfN1cLb9lgwQ+/8s2gpMIZFsu
	enT7pJOj2Si62dCBHs7cGIDSuKXxwn+X2c4VAZapiuJ+mL//VY9OSt3X4XTh84JKzrZJyTl/vU7
	cg5XVvM5npYCw0nyZzxJXWolnTta8igD2GDrALcWERaVyR17L8lCz7JOWDmiQjx4ALFAY8SsRU2
	6xsRCL9+ps9L2y64ACLN1nYIPVowdhghHLXn/FjYCLq04WShlwOgqoFmegFTaihBWdgM2AdgnFR
	X/Ls0NGmT1y3Czqkytf3wT2mGrOhNvoINbZSkLr8Ckf6X2EsXHtUm7lsOgxzU1CCWUKUzaXiGS2
	sI+ng98AN3MMqRIBbhqBZSX1jf67Ng25WXe6EZOTRwg==
X-Received: by 2002:a05:6a20:4127:b0:3f9:357c:bb82 with SMTP id adf61e73a8af0-3f9357cf962mr5712893637.52.1794927277048;
        Tue, 17 Nov 2026 06:54:37 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm5270513b3a.13.2026.11.17.06.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:54:36 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath12k: hold dp_lock when updating monitor user stats
Date: Tue, 17 Nov 2026 22:54:31 +0800
Message-Id: <20261117145431.1092736-1-shunsheng1218@gmail.com>
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

ath12k_dp_mon_rx_update_user_stats() looks the peer up with
ath12k_dp_link_peer_find_by_ast(), which walks dp->peers and asserts
dp->dp_lock, but the monitor NAPI path only holds rcu_read_lock().

Peers are not RCU freed.  ath12k_dp_link_peer_unmap_event() takes
dp->dp_lock and calls ath12k_dp_link_peer_free(), which does list_del()
followed by kfree(peer->peer_stats.rx_stats) and kfree(peer), so an
unmap arriving between the lookup and the use of peer or rx_stats frees
the objects the monitor path is still writing to.  The lookup itself
walks a list that the same path can be unlinking from.

Take dp_lock around the lookup and the statistics update.  The update
only performs arithmetic on the peer, so nothing that can sleep ends up
under the lock.

The affected code is present in v7.0 and later trees.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Prepared against v7.4-rc1-1969-g666539eecdf4.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.

Testing: compile tested only (x86_64, gcc 11.4).  No ath12k hardware
was available.  The affected code is present in v7.0 and later
trees; v6.18 and earlier do not have dp_peer.c.

Locking: the monitor call chain holds no other lock at this point
(ath12k_dp_mon_rx_process_ulofdma() and the rate-table helper take
none, and the monitor paths never take ab->base_lock), and dp_lock is
not held by any caller, so the added lock introduces no inversion.

No Fixes: tag is given because the introducing commit lies outside the
fetched history of this tree; the code has been present since v7.0.
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index ae14e118fe36..edf7a8142998 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -955,9 +955,12 @@ ath12k_dp_mon_rx_update_user_stats(struct ath12k_base *ab,
 	if (user_stats->ast_index == 0 || user_stats->ast_index == 0xFFFF)
 		return;
 
+	spin_lock_bh(&dp->dp_lock);
+
 	peer = ath12k_dp_link_peer_find_by_ast(dp, user_stats->ast_index);
 
 	if (!peer) {
+		spin_unlock_bh(&dp->dp_lock);
 		ath12k_warn(ab, "peer ast idx %d can't be found\n",
 			    user_stats->ast_index);
 		return;
@@ -966,8 +969,10 @@ ath12k_dp_mon_rx_update_user_stats(struct ath12k_base *ab,
 	peer->rssi_comb = ppdu_info->rssi_comb;
 	ewma_avg_rssi_add(&peer->avg_rssi, ppdu_info->rssi_comb);
 	rx_stats = peer->peer_stats.rx_stats;
-	if (!rx_stats)
+	if (!rx_stats) {
+		spin_unlock_bh(&dp->dp_lock);
 		return;
+	}
 
 	num_msdu = user_stats->tcp_msdu_count + user_stats->tcp_ack_msdu_count +
 		   user_stats->udp_msdu_count + user_stats->other_msdu_count;
@@ -1038,6 +1043,8 @@ ath12k_dp_mon_rx_update_user_stats(struct ath12k_base *ab,
 
 	ath12k_dp_mon_rx_update_peer_rate_table_stats(rx_stats, ppdu_info,
 						      user_stats, num_msdu);
+
+	spin_unlock_bh(&dp->dp_lock);
 }
 
 void
-- 
2.34.1

