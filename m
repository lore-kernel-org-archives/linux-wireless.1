Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434341;
	b=EuY/j/4Mth66Qw0Xoz7DTLpCwHBEKs/0hI3JhPIPZ3/SA+/glLxuAiq9f+lAqaDUFwPd
	 kmdFi26t+040HZOM253eEp92RGctu7Pp4mWBtp0W8rABYikKneUCpd733j+AzHSmqTtAN
	 CZniKNiuLpBaya456YYv850F/xAuadZMdRSC1yZ1mJ58NqJOtX+/7sMHFKqkkSDvgYquY
	 Hx2nK7EwIdh2w2IV69p8YcD2yIOSwiICRqSEAmkBZYz6SuCq7HnDs+p40J4/I5Hw91Aer
	 6mrOCtAijbeOQhUndZGanX4BVwDlB7cCdZ0tWFZcUZYjVvCxX0U5qWGltElaR3yYutw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JyrI5c1CwAeizeSx3dYvL2iX6nP8MVXXZ8SSttkgR4Q=;
	b=rqlhW2CjrYkiQgQXyRjB+WCy+RbCd/iG24dL8LRIJ8IOw/9PpjMbsBG6gvkQYkxrOvD1
	 jpHJT8hzWuMAfFLdYtuYRkqw68PcBGNaicWc7H4hk/uSDJeeB5fDluclM1TblQ++cYz6h
	 RXUh9aUNkqexRiJBOVr1p7TWNtfxG8EPOCEyYNZRqNg2GEvDFYRq/IewCgBHLf9/jdCBo
	 oH8v3qIKaDSZ3pY3k8+UWzs9mnA4fr3CvIUsfFmOyBrm67e5KBYtvOjrhMNEH7i8DtW3U
	 ZX+ebb8XV/zHHqPzkccCe/qKZQ2XTiI8crxhIkdBKDf6fRVoogruOaypZr6Chs9DDfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XXKT1ATl;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8780B60A380C
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 21:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8780B60A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XXKT1ATl
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b309147589so39384647b3.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 13:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434340; x=1795039140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JyrI5c1CwAeizeSx3dYvL2iX6nP8MVXXZ8SSttkgR4Q=;
        b=XXKT1ATlJqhP7QoVbWUnDDCBbbTAir+2KL7g7EmW/dHWNskUTqKKTIILqA8Ogpnmlx
         RbBX/t2MMQUNXiNnjdtpVkxstChsE5Zrwi/QPTvsreEGkDT3IUJDoPqnrskAlTdJQbP0
         jAi6l+Vr7+/yRrLoedX6JFWvOgv/m4X9sUn4Lu7SPGivvbab3kaHCLkaHJVy5aGFO8Qd
         AAwrb1B+xH5TA5EAoBxjUh+ZNmiVxIzImVdfaN+62oz7a5bLIwJA4mYP24se75PWnTIy
         feN6FaUFcamO3MQ8CRQLnQhSvw9nb/iV0BDNTG0lfOsvk6TbbjWCb4owzH9I7ipShYoa
         mbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434340; x=1795039140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyrI5c1CwAeizeSx3dYvL2iX6nP8MVXXZ8SSttkgR4Q=;
        b=O1EVvex077/VLfNMkgMTHxy/Z0Gw2nMHHv35ZAXkwEzlaFMqBs5S85L8uoa3y+q45e
         EanB0NF+2Qrv0tx5km4nNGm+FjlqNnP8RJ6hnpz0FKQoSjodakVmZMy2/Bv5w5hIBoY8
         A9ImGjYwS5rZUqVFdjwK2mn4JCSrnUaigjLrzWdqOr9muU2X4mOJcZzfw/fd8QA/TTqP
         5KmG9vXhQoXVC44721wHby3CFWGfcvM0j+swxuXTzOHyzNgv7dToFAWhWap7e+UaVvg9
         VWBc66fUqWbOOb+plb1zv0jLeZGWX7rZE62QP6cJ9L+P7x/Gt+q9Cs268T2pAwTG/pjz
         +0rA==
X-Gm-Message-State: APuU4Z81pL3+v+jMahtit9EBub3sct79PdJsg9Tp9zsMDEsVTbs4mfCL
	tDbrwp5DhcZvFikVjvdIs2RO1BHFDruaEwSdPzjIj4Wx3tmQC5pTxC9c
X-Gm-Gg: AYBFou34v53+YNnFsAkOk6ZYQHrBAvyiR5LzhSFYxjVABXA12g6az7gxlya5BuIoHs5
	xEzf8RU+Elz/yLBcFxxzwXwjpGuNlr41dfhKQVuhsGO5Rfjuw1jbMCXSfhz/lDzB8MINVx0X5In
	eXz7RxrwX2HFmhmtx6IJz2FqVFKuR7dZPrCJGu3uCHi/xg5r0k/TKA+vRIAWRSpODZDjlBQOf7b
	peETghRqWDKDJLGWMcRsV433r1irnutA8Fh6o8IUlW2+EwuTDX9K2MiVVURefaM302BZGJABVlE
	2Qa85u1jW+wVDZtdRt9sFS1qSm5ubRFHF42pIsLMioBJy7XxM4/gObW1kf5BcDCJe4iQbR0T/Pm
	LaoV/mFzlfNlis5vqIakdxFwxernbs+XNirJim+DgvitKBYi/3l/OqCgNd2pRSW8JbXBjgn+HhT
	atxCmfehsWXb4iOUxPxGfBQTRj5eFaB1EDtv35ANH1/V/5t7f2tbyArryXEsi2xbMlvF+VO9VcD
	zDZsTASeSsDLDSeXGzlGO3JLQRh8kqVPRkPMc9Eax75FNQANzLc25ExwlQy+PEGi9JwWmg84MsQ
	MJ0W6dU/rg4k+pqTFhz9KExtdFsu5jGdfsnPFK80ioH+GQygpqgEJaWbL/HKEpdcHBDnjEvbIe/
	g2xFi0IBcCDgTfJn9FegMGnHSZV9wdMB8UchIOjkYTY6q1GAxNeYR0qx87hH8W89JQpoM6OrK4d
	BSsED53Q==
X-Received: by 2002:a05:690c:d87:b0:8b0:ab62:c636 with SMTP id 00721157ae682-8b3a8188200mr30390687b3.45.1794434340531;
        Wed, 11 Nov 2026 13:59:00 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:9771:d7f:1e99:8362:7799:8e00])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39340e374sm54959677b3.28.2026.11.11.13.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:59:00 -0800 (PST)
From: Ronald Ouyang <repaxan@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Ronald Ouyang <repaxan@gmail.com>
Subject: [PATCH] wifi: ath12k: set OFFLOAD_ENCAP_4ADDR on interface bringup
Date: Wed, 11 Nov 2026 13:58:45 -0800
Message-ID: <20261111215845.814490-1-repaxan@gmail.com>
X-Mailer: git-send-email 2.56.1
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

I tried the WDS support added in https://lists.infradead.org/pipermail/ath12k/2026-May/009382.html.
With a ath12k WDS client, the frames received by the WDS AP had some extra bytes in the beginning of the frame.

My understanding of the problem:
1 - this is a WDS client, 4 address mode.
2 - on interface bringup (ath12k_mac_op_add_interface), it has OFFLOAD_ENCAP_ENABLED but not OFFLOAD_ENCAP_4ADDR.
    so it software encaps the ethernet frames and sends the resulting wifi frames to the vdev
3 - on vdev bringup (ath12k_mac_vdev_create -> ath12k_mac_update_vif_offload), it has OFFLOAD_ENCAP_ENABLED.
    so it expects to receive ethernet or "native wifi" frames.
    it also sets OFFLOAD_ENCAP_4ADDR but it's too late here
4 - the wifi frame from (2) gets passed to the vdev marked as "native wifi".
    it already had a QOS field in it, the vdev adds an extra one when doing the hardware encap

This fixes it by setting OFFLOAD_ENCAP_4ADDR during interface bringup.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Fixes: 729cad3c3c9e ("wifi: ath12k: Add 4-address mode support for eth offload")

Signed-off-by: Ronald Ouyang <repaxan@gmail.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index afa3556480d3..1b1c3f738590 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10275,7 +10275,8 @@ static void ath12k_mac_update_vif_offload(struct ath12k_link_vif *arvif)
 	if (ret) {
 		ath12k_warn(ab, "failed to set vdev %d tx encap mode: %d\n",
 			    arvif->vdev_id, ret);
-		vif->offload_flags &= ~IEEE80211_OFFLOAD_ENCAP_ENABLED;
+		vif->offload_flags &= ~(IEEE80211_OFFLOAD_ENCAP_ENABLED |
+					IEEE80211_OFFLOAD_ENCAP_4ADDR);
 	}
 
 	if (vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED)
@@ -10939,6 +10940,9 @@ int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
 
 	vif->driver_flags |= IEEE80211_VIF_SUPPORTS_UAPSD;
 
+	if (vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED)
+		vif->offload_flags |= IEEE80211_OFFLOAD_ENCAP_4ADDR;
+
 	ath12k_mac_determine_vdev_type(vif, ahvif);
 
 	for_each_ar(ah, ar, i) {
-- 
2.56.1

