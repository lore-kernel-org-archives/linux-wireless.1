Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371148;
	b=e16/wGVYQpllXD+rU17ZfrwKuQ/aANGdTrf77U5E81i62pCC5JRJfe1zyl2i0JSjQ1GS
	 K6MfoB4RyJ6J+csnW0TF/7WGVSm9qhNuitxTuzzFw/2VSkMfBJ80HXJSscB0Hi4mKCIjb
	 1R17xh0NO7Kv9Az7jp28l+eL4qcuXwZPybP3HxX0R3d0MlrIpH7/aTd+W4v/S2/Y7/8qt
	 dioFI+yRKy+fvS9EObPAv7awYAbTXVoNlZiqDIWEI5OKTeFw3ygCh1/RUdBe1lHTpqq/h
	 +TGfTUrr+/D2Y94k6fX2YB625MzW2PEolQu93TmmpcrE3Yy80zxTalLBFW/dmrl1jKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nnRymrH/K7oTLw9QYuTYFYeqI9p+TNSIh3hf9Y1fVeo=;
	b=BPzNwBekk/cUjNeHdpsIJkSOIl6c6WmDv4NoiDJiympxVB6AlnEP6vtB9E+pmWl1YMnL
	 e8J+qwPR//pZTKex/NdPAGODcQy0zsQCEnR8HT+M7PX+3UNhS7WwAS5Y08GeCijj0F+gY
	 mBIPZ/+0HfFC8DGCoU8oWbSTedTIJ/yLMamMY8LhJr0xp06vR6cowagQIjx7k5fB5Tr12
	 ndgmY0UbgajmKCxE0MwLbocJSV9FrPKO31GxggYGMyXZstxy8aQ14QN2fVWioiQDtlL+l
	 8xJkS/Rmzsqzv9GyFTLrZGJqVo9kUbXXqlwhYVi+bNf6VmXMps9OKr+E5HOIsO9kQ5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kKiByMsr;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886AA606A68E
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 18:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 886AA606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kKiByMsr
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b88d143160so2945305a12.1
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 10:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371147; x=1795975947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnRymrH/K7oTLw9QYuTYFYeqI9p+TNSIh3hf9Y1fVeo=;
        b=kKiByMsrkjNwXuTk56h5FqDM7S7N0uard4jVBuyv4NZQmL+UrNItMDadSUx6uqM7sL
         z8wT8XLpQNaioghpmaYhMBcgoclYK5i82Y/1r/i5no7aK+qIoB6YNWTF0llbL6282Yj8
         DSYMwhKlnCjm+lGjcRiUnOGV+VASs9Tbd+1+FbEBkLRybZvnabKRtCeFR7PHoypty4qO
         5tmoqARpxxP2y26rKLiIwpkoHNapZpaO1qLaclf/rO4DNKguyJ5vLNLdRctP5KZEpohU
         +fpCS49+Jyj62F6V3jNmxawGOEjWwH9ik24zG3J7dXmCKpszZ865VlnfdFKrKJuMXgPX
         MCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371147; x=1795975947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nnRymrH/K7oTLw9QYuTYFYeqI9p+TNSIh3hf9Y1fVeo=;
        b=rBwax0AS+Vs8bDZqm7riVVBObK712574S8Pm6jgk8lusRbnZ7/rgqcXvw0Kju5uyC/
         e6DIB/TZjQeOD757luTzpkT9l+/YBNeCnKWl/S2My4q8iacgUABWzYDLw/DmPB3TaK7q
         v42j8jbgzdR7atfgaG9fXKPGQ/CeXE0tP2ecNJJ8k6zHiREaggluuz9iDAk2YU2uTTTI
         XWGLelc5fTAbMaX4dPHKjaRE/4DtutVk6B3i+pMQ0JLfkHq87aepibo81yaHjao+M3DS
         /XZ+rwpvLOkbuOz2qQW+yLfr2cbiK5gUztPi1HHOvIXaQA2z0kg7z7ZES+spfy5q2IPX
         SBLA==
X-Forwarded-Encrypted: i=1; AL+hErE1o4g2xLBRn31h2Snja9H74QKyGzR07t5L4MsMoOxWO4ckgC+WqVruF9v6V2acYPf+QYqbR/hJ4a0/6VKhPw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8HExdqjS8MtsJb0aTjYForNQZCJFhZn584NYp/XkE+NulRO5WM
	I7IO5xnT8gv4LXzIw5Eh09t3TBJU3Cj6RL5iZ5x112byKbBfa1NRlhPmTweoQXT/7w==
X-Gm-Gg: AZFdTZeom20AKHSNAHv+sTV1DjgWT8TWKGzUAo/6W6KuTO8mfdkenm4QRS9lIp+sxHv
	SPrYYv2Zuky97RgMlm4Utu8kGTdJHMDKUP+i5rKqaYjJTntTiE/+eFbLav7w8B3Co6CMaO+yCaG
	dBWwUynXdFE786tGZLMSIsJ+DwKFnv5KshhKBAS8sycdOldDxbYEKIvbExuni9MQIbsckvxx0hJ
	xiUAFRB0vyzhigRSRDDkYEPHYkOegaxAQDVev003LFe2wgsxgoKF2Rl0zAitF+AKhXV1aSe6tbD
	Y/vBwLV4RosnxiAQ2bETkw3b/fJW7z/ojmSUuTd5N8rTuEgyU9gZGHeECt/sG0ylTffehkjfhDx
	dYnMfq0HPiakjPoUzgkAU3kIkDThM9UdPwEYRTpsls6daTY29NQBHtJsOZkTF/QsBZedi7iqrX8
	MhDzEIgm4D7UWn9rJ6oGR/J2PVMfn7ZHp7W6UdBYAvNMfS4i304keqcKNlXV8JGylPD3/T5NoXK
	hAAFQxuHy8AGkSTg98ND6rBI9XajJpxPuI64LMg2x9NaIxdTGi4padUnMHQYKg1OL/9G46KLyKL
	eqVZVfK8vHaV96n9QBSCkmFnrpEQrvqD4fsD3dtaAHuMXOJuyQsdfATi/GCMbWALlvYJZWnVQHn
	o8Sw9b0h/8SeRWLoDe0qz6rP2XnFqEGOfnINyGNmXNgw9OH8kkeOL/pah6AVjRSTnCjWdsF+9qp
	BjwcPmz6ddnl2JMqUtEm/oCNAIH7bJ60nISktWu+FZFr6g9Vwha0pao/jS4JSZYPhtEqHJRAX6t
	GwQ032tLf2HqM3DP+uEuJ4LtE/mAqOXIKyRJtN/o1XGmamGcM0NZx0cu8Hof/Py3qZ7TojR0ews
	ieTH8xzHeYIwFBSpt0T6m9V1YqfwHcv8dofkdPhORmAmPjWpDYys0AsReO5JhVEOg4maWuLS
X-Received: by 2002:aa7:d287:0:b0:6b8:818d:520c with SMTP id 4fb4d7f45d1cf-6ba37c7ba50mr4620662a12.5.1795371146993;
        Sun, 22 Nov 2026 10:12:26 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:26 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 7/9] wifi: ath11k: take TCP batches as long as GRO builds them
Date: Sun, 22 Nov 2026 19:12:11 +0100
Message-ID: <20261122181213.1016590-8-julius@bairaktaris.de>
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

The netdevs offer ATH11K_DP_TX_TSO_MAX_SEGS (16) as their gso_max_segs,
but a bridge or router hands them what GRO built on the ingress port: up
to 64 KB (the default gro_max_size), and for a frame list up to 64
segments, where tcp_gro_receive() ends it. At an MSS of 1448 that is 45
segments. gso_features_check() clears the GSO features of every frame
with more segments than gso_max_segs, so validate_xmit_skb() cut each
such batch into one frame per segment before mac80211, and forwarded TCP
downlink reached the TCL one segment at a time under load, when GRO
batches are longest.

The 16 is no limit of the TCL: each segment of a batch is a ring entry and
an MSDU extension descriptor of its own, and a ring has 2048 descriptors.
Raise the bound to 64. The transmit loop then takes a frame while 64 of
the 512 TCL ring entries are free, and a batch keeps 256 bytes of ids and
descriptor slots on the stack. A batch whose airtime does not fit the
estimate is still cut by mac80211 before it is queued.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index a923ba792e4b..1bdf2f564dac 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -81,10 +81,13 @@ struct dp_rxdma_ring {
 #define ATH11K_TX_COMPL_NEXT(x)	(((x) + 1) % DP_TX_COMP_RING_SIZE)
 
 /*
- * The most segments of a TCP batch the TCL takes whole, and the payload
- * pieces of one segment past the headers
+ * The most segments of a TCP batch the TCL takes whole: each segment is a
+ * ring entry and an extension descriptor of its own, so the bound is what the
+ * stack builds, the 64 segments at which TCP GRO ends a frame list aggregate
+ * and more than the 64 KB of any other GRO aggregate hold at an MSS of 1024
+ * or more.
  */
-#define ATH11K_DP_TX_TSO_MAX_SEGS	16
+#define ATH11K_DP_TX_TSO_MAX_SEGS	64
 #define ATH11K_DP_TX_NO_EXT		0xffff
 
 struct ath11k_dp_tx_ext_map {
-- 
2.53.0

