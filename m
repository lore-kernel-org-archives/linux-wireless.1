Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371153;
	b=BfWKh/Y1QEf+5gX9gpiF2dj9EGm8UV0c6dhBIoa8AydoRWpjx9qOmIWQcJkzb7qVI6ac
	 IyTFTtsFMEWJQruqlKx2nf9RPbTgtEqtiBosxnDuAiqG8750ewCM2rKb8VueQjZkwn9H2
	 CY82joMwSv6EvXOOeQPfYZwNnCzwsM4dmAO7j5DOGN9lcvMO0G5R1Uy8ZrTNyVHS4BDzf
	 LSdb7FbJ4+wFAfUdBfgiGp7+PPet1LcT7j6Axf/j/fb1nqwuN+FYhQyCiY3T/k5ImYLbx
	 WilFdXGgTXzYwrFl/qGxDvFKWgeMVCHnEYHy39Vasl0sI2FxTS5mYJaWgeoWUabHIwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hRFBwr5nNkuMz7lc4vkcZig/cSlg7IXyKLH1tJ1rFzY=;
	b=Bc3kA/sBhSXHcL1FHjdLLaR43piVkqOd+XsWGwlVwHJIgcNEtlNomP1pcw9uhcFBTuiP
	 2gtp2PYH5LBYhB3oZCmsSOe+lIz2gntZssG7ozTf6kEG5r2NOy9Oix4R0V/kYbMw5TI38
	 Dfi12hVitt4WWvyjgyEfzDkHEg4mQPL2Z3O/usKJXJ2OdgoGxpEblNC+WTPA/+odXdGj4
	 csoV3ljPag/7Kt2Y/dUnjowMr8zEPMV8youVWXwIfgYDeqd+Z7/W6aPYvrdPtje5bpXya
	 EDUOl/Q9hpvo/kEsMvKD/OA+g5b2fD/Ixzvfzi3zOSHgYgZjq/QQe0THa/JdBU8Yr6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="r/AuOn30";
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1490606A697
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 18:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1490606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=r/AuOn30
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so2943092a12.3
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 10:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371151; x=1795975951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hRFBwr5nNkuMz7lc4vkcZig/cSlg7IXyKLH1tJ1rFzY=;
        b=r/AuOn30ugx9/Z0cqbXZw4BY/pO1eUbTQFLh0p2YQMBU9vMNFlCPsMSpQIRDpP8wXm
         JplkShyVumkohtYVLAMYKDRN1UPJR4r34YwOo4FRuk/RGVViv8bmTY3WP5NdugvEpVqY
         2kGq+rO5ElfEZLFNOHCLpibbdLpnyH75PZSZzA2D24SGgmDlEbidMpEInm0M67J25ylI
         KP1pVnec11yCLFoCuEWjx06P44DGfokxD3rOb50y1Up5/p1jTVglEVnwa8+oL3qtlJgi
         i4L3jpowporYyw/lIrFZzcFSvOS2PNfhe3ZyRzLKafuMXR8QSKSAcmLUzk91Br7JhBhx
         lG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371151; x=1795975951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hRFBwr5nNkuMz7lc4vkcZig/cSlg7IXyKLH1tJ1rFzY=;
        b=2Qc639U+mhBCWVigq43Cmv+PVbPOSbYNX7ptCCPOk4sLlgZz9op5Azx0Bb0IkikJRd
         4n654ZwB9BFk0w81Y3XEJt/z9wgtsz5GeI2+hgWJNd1Og9hTvMg33NZ5aAvUgTFMwDNk
         e/l/6a4yx9rCHT0j4ZuuUE6l5fX2sTk5nyl0jO13cT/Zkym03YBMeMVQrcHBlYgnTqlf
         Tc2Dqw33pv9LJdolkxzPvp52GTe1/X3SPm7hjwKPD7L+I12LRi4voU0Pay+nwwnCHZAS
         bbGqVfQJtq1NdRNKFSLKBMN9av0GV6ruuuI9rFUSyLFg64M0KcbohNo5PJtF58f64wwO
         cFqA==
X-Forwarded-Encrypted: i=1; AL+hErHGwajM4gcfdJbcIsVZVKvm5eaorV92+DQTH4xOACUaMHr7ljxd1tkATyRgLR9u2FGbjJHrXoHnEIqJSqjFTw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9dDFRv46mF/EWygi3wU1g/MGkY1Lh5SzLtvwtx6+iiM1sQSdwu
	Nkeh/r9D/6Ga3+jL8u2N9/EOCSbNZ0pvE6R06yEWY1wF28ic3Qac7pO8Lxobr+CBEw==
X-Gm-Gg: AZFdTZfsx/EIjshKvPhjDa3wY6uNwL8agmpM1YgIgWR3W8PIN5vby3ZFE/lRlsDWLs9
	NVoDJL/6ZZke8jQxJP+NDCfiRCiXzc2k7SH9va5MRQZRT0snKp8/IMHxtrvs9QChplgVO3sVMt/
	Amg4wzhhe4oTv8Dltwz3HqY8tz/o5T0NmayDtVmNnPRKeukisbsH2TBU+CiMrjxw8crfA2qcUyl
	dlvQYvKRdcizYP13oqELu2oFFdjvzryvNNC7SpEYmF5Y21JoopkK/Nk+ju2s6cMIWpfHpBtCYcW
	EPgM2pyAe5gdUBGgc/BVJ1YS1PEL/sLCNKNslQMWOHXieHyjE3vsCrTkYvD2qqgiV3W/yWqUocs
	C/U10vnbMooyPHH4jmzCv28X5TTXrn1jlU/JuvXO+2riorTnk9CV0LN+aD3CGegl78ASgRZsMND
	dkGEfebHtYNiOW2257vqYKg4z3aJrY8fkBdc1v5s/TUbkFfX2JIwPgzJisRL0D4JqHG55r/VjSK
	e/CEXt96w4FUv0cdEW61X+t37CBNShB/IKT0WBilkajRwFaP1sx0iC1masn6UAGka+7YG8YkOxS
	tG6JVqoPA/h0GQq+dpvQtuXcN1gYrzhrWiCocWmzG9Dx/yowQJu0M4IetlPfhrYS+QxmTrO1Gya
	IyXMt/BZNOUltj6oEsDVLCAxfJsd5xfs02FKmJGJKulssr9vPvXEb9LSUXvMUfuyW5YNrRWwtyG
	JdoemkrSC1SGuMRvKDtMDX724Y+pF73OUKpCm7t1b+so6sy/JUbTmHbdQY/9nxFb+Z1akwZz4F7
	4DITs+D1UfSsGBkBM5uBXXN0RjhxZ9vRwBMEIvMmB64zH4j8VzZ8hvamUzc/64IAdRumFLgjila
	2HjF8xTaZMFm/gT1xQU4pjxD3aBBXmsMgSqShsYC4W3r6rqnmnmKKa0SmvHTwEJax/6JUSW9
X-Received: by 2002:a05:6402:1d4b:b0:6b7:9ced:824 with SMTP id 4fb4d7f45d1cf-6ba37e97cf6mr6095104a12.26.1795371151306;
        Sun, 22 Nov 2026 10:12:31 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:30 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 9/9] wifi: ath11k: count the segments of a TX batch without an atomic
Date: Sun, 22 Nov 2026 19:12:13 +0100
Message-ID: <20261122181213.1016590-10-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181213.1016590-1-julius@bairaktaris.de>
References: <20261122181213.1016590-1-julius@bairaktaris.de>
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

A batch the TCL segments from extension descriptors holds one reference of
its skb per segment, taken with refcount_add() when it is sent, and each
segment's completion drops one with skb_unref() in
ath11k_dp_tx_buf_put_id(). That is an atomic on the skb's reference count
line, which nothing else of the completion reads: in a profile of routed
downlink at 900 Mbit/s (IPQ8074, one run) the instruction after it takes
0.44 % of all samples.

Count the outstanding segments in the frame's control block instead, whose
line the completion of the segment reads anyway. The send sets the count
before the first descriptor is on the ring, with the frame held only by
the driver (its reference count is 1 there), and every release of an id of
the batch decrements it: the completion handler and the firmware release
paths under the id lock, and the teardown, which runs alone. The send's
failure path gives its ids back before any count exists, as it gave them
back before any reference was taken. The release that takes the count to
zero returns the frame, as skb_unref() did for the last reference, so the
frames of a batch complete and are freed in the same order as before.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h  |  5 +++++
 drivers/net/wireless/ath/ath11k/dp_tx.c | 17 +++++++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 11c79d0f5c34..32f24e1a396f 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -128,6 +128,11 @@ struct ath11k_skb_cb {
 	 */
 	u8 tso_try;
 	u8 tso_bad;
+	/*
+	 * Of a batch whose segments are counted here instead of in the skb's
+	 * reference count: the segments whose completion is still to come
+	 */
+	u8 tso_left;
 } __packed;
 
 struct ath11k_skb_rxcb {
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 089696bff4c8..2d044ed408c0 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -245,7 +245,7 @@ struct sk_buff *ath11k_dp_tx_buf_put_id(struct ath11k_base *ab,
 		ath11k_dp_tx_tso_unmap(ab->dev, map);
 		tx_ring->ext_free[tx_ring->ext_num_free++] = id;
 
-		if (!skb_unref(skb)) {
+		if (--ATH11K_SKB_CB(skb)->tso_left) {
 			*more = true;
 			return NULL;
 		}
@@ -638,9 +638,9 @@ static void ath11k_dp_tx_ext_unpad(struct sk_buff *skb, unsigned int len,
  * its segments, and the payload in the fragments. A TCP batch has one
  * descriptor for each of its segments, which also gives the segment's IP
  * length, IP ID, TCP sequence number and flags for the TCL to write into the
- * headers; every segment holds a reference on the batch, and the completion
- * of the last one reports the batch to mac80211. A frame with fragments has
- * one descriptor, and is a batch of one segment.
+ * headers; every segment holds a share of the batch's segment count, and the
+ * completion of the last one reports the batch to mac80211. A frame with
+ * fragments has one descriptor, and is a batch of one segment.
  *
  * Returns -EAGAIN, with the frame untouched, for one the TCL cannot take
  * whole. The ids, extension descriptors and ring entries of all segments are
@@ -829,7 +829,12 @@ static int ath11k_dp_tx_ext(struct ath11k *ar, struct ath11k_vif *arvif,
 	skb_cb->ar = ar;
 	skb_cb->tso_try = 0;
 	skb_cb->tso_bad = 0;
-	refcount_add(n - 1, &skb->users);
+	/*
+	 * Each segment's completion gives back one share of the frame,
+	 * counted in the control block under the id lock every release of an
+	 * id holds.
+	 */
+	skb_cb->tso_left = n;
 
 	ti.encap_type = HAL_TCL_ENCAP_TYPE_ETHERNET;
 	ti.meta_data_flags = arvif->tcl_metadata;
@@ -898,7 +903,7 @@ static int ath11k_dp_tx_ext(struct ath11k *ar, struct ath11k_vif *arvif,
 		ath11k_dp_tx_ext_unpad(skb, hdr_len, pad);
 	spin_lock_bh(&tx_ring->tx_idr_lock);
 	for (j = n; j--;) {
-		/* no reference was taken yet: release the id only */
+		/* no segment was counted yet: release the id only */
 		tx_ring->bufs[ids[j]] = NULL;
 		tx_ring->ext_free[tx_ring->ext_num_free++] = ids[j];
 	}
-- 
2.53.0

