Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794409;
	b=1AHdq+nDaUYV4YWoAA0tG6vGEPBrhWWIfIWQvlCgYkN6FhOfYEYVUo48VzJL2Lbeoslz
	 Un7SDr4Neg4LqTzPwLSwfR/Lh6t3T7xj6TS2Z5YdiDWHGYifZrwurGbcF/4XFp/O5uzdn
	 98/5ju7esMOoJsMp3y59+VFCKwiNUO+Y90N/sPAe5aQxSZJF96Nhv9aOvfZnxMpNanz9l
	 d7FjxhCNjwGzCcl7IfkagqJaJMOreJ0Qvn7GpSRJ85k8hGa5TnJ/POjHut1hsFplvKcvr
	 /31CNxZ3JRf4iBdAJaApTNRNPJG/RT2mc5lb9NK+FceaTYwQ8GDhQg1UDe37R0MzoZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=iQSBCimb2HV88dBcn7CRS0IAHMQEQfAagxqmbFiIr/8=;
	b=LTzq4X79qOt6f+itkcoH1OsjYhzjyIcABANADdBmdRgDRz/erPT6CEXvp6RoKkyNY/E7
	 U7xKn5AiR0N55R8m37km0OJnO8JEck6SWc5hGile9OtkeJ740bflsCxIsVydT3ftD10AN
	 X1TPGsMZB0YgEpV2ONH5bWdrGuQxBdKGEU+M1uHIodm1YiAJmRp8gJmnxoVjRTqXbiwo/
	 +HO9dYcRFk8rJZ2BpshGjjf4H+OELCVF918cqpM+OmEmfx8QQ/A90cJRlc/hK5YZsIoZF
	 gSH3pb3rI45empAxFGV3iGVB4TlB19+ivhfyAAAJnTrTweKLVrcjj+XbfQj5suXpDGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWHNLF4u;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D32606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 02:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80D32606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWHNLF4u
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4cc793704so5853297b3.2
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 18:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794794408; x=1795399208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iQSBCimb2HV88dBcn7CRS0IAHMQEQfAagxqmbFiIr/8=;
        b=XWHNLF4uM0Cf7Z2KxErrqSZfDfuUquFaW5MycPuRJZFDUrhLMRLUbtLYM9DMfZNOJx
         vJtRb30WWZvYJJJ44Hlq/G9ClP0Udfa5bY+dDhknDFib4mwq1G6NlnvmYInRr+pw4qF9
         Vx0XULJTvZGLzU9Gq3aphxFLKBvANnwKPO+bHFT95AfTejRdzXir1u23ynygJzW/djdS
         D7c+PBvUqgI1oZ6BuCpGMTN0nQCaOuQ83LEeXANsGIqvfva8NoFXajWVbOfH+v5QWu0T
         TWYKjqkKdDq7QeSGLdOINnfj3gPJ6MmWT2/SmBzIy0HeKa3WjWjXSvc/4GTtPGctSE3I
         garQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794794408; x=1795399208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQSBCimb2HV88dBcn7CRS0IAHMQEQfAagxqmbFiIr/8=;
        b=nW5CKISMqT3k/swB2GI6RQyoj3Kj4CLOXwz6Zj7t/2knQv4elA7/ELUlutDh+n/0Vb
         +gneQSdWAMh78k9jSYSHcCoxWfpgXQkYG7P856FFlF5+mCedRr+IYMQw3RY/w3qvf2+f
         n39vHO8DYQeyXTtHDwUr3CsFnS3RdI8nJBgaDQN3aLmX7Gb2oqueYU/a+iwKgk1fRjS2
         W0bnIw9R2uPY9Uh4yooV7Og6rDQdw9KHmAA64MM56rGoJpkjfNjJyiTUyDGps79wmuaO
         aKGxgXG6UoYSso5DgVj/pWaFZxnovnMkYALbcYhjfDWJlqFKvPDWEq7lD2oUiACwczEN
         uzow==
X-Gm-Message-State: APuU4Z9+YczUxyaFwRV0A65Q4a+EctdPf3sJIEhOkJUz8qUNo+XTZsWF
	8gYvlrDwSZkNdZdaP92biRa3kqVG3lainC3JKzJBck0+3pF7VNHvQBeJ
X-Gm-Gg: AZFdTZfxmxtZBYjvMbqNHFrr8nYSvE712oXm62dbVUOHUDdua2Kd8rfG2Wkhwo3Pa7Y
	0Vh5bT/AtMP5HibFEd7g5E0R8szSoatoiAaXkiPAq+yuPRMLUNblhctYo9O6am0WOlKRU7dm6ty
	rLB/bqAOj5A8kSHDBdTzU4MPWBkHjCvBook/G6+MolCxh7YBg3apSvdiEL3eACJfSYYNoCj4CGH
	b0C50ENXMeRCT3knLab5RAoV7uf9WZTxijGN26lKs/ntoiWvCunxymWaI85tfFMoJC+vbuN3U8H
	7h0ILa9UuiChq8cmRoiCK+wwx8RkGF9TcuJ4YOmikIJVIV4Z6I/+KeWX4vZD2ig3AtXqjHjHBse
	01XO0Bm611Fyqe/SoAFBXOoO8UgfkFUo4kijJpIBDQ/AbbernH6urmG+z2IVCCk6bxGMyGablL5
	IPy+NShV8G/hHlLg944xBDMwe0YOJAArXqCkiRVAErKkMO5xvirtRlc14/xj7GXiz/sdcJ4/iek
	BxvMbEqo/V2fX6o1raKK7QKJA9rJl62IiD7UIOGXV3wx9ukJT4+cqs7lvSlo5tF7bF5v2DlTMKt
	ERMG67n2y3p+hZ8pIfmRVLg9JBeiM/aR2CPU1CRnArTIgGD1wvzWFuCaLwY+8uYVeAdxh8/y02N
	5A5dFoNiMnMatlf0ZF7IiyJMI8w0WYruScbO3YED/N29umcRqv887Yf1tztnJ
X-Received: by 2002:a05:690e:1341:b0:67b:f328:267d with SMTP id 956f58d0204a3-67d8937ada6mr4503802d50.22.1794794408160;
        Sun, 15 Nov 2026 18:00:08 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:9771:d7f:b238:f861:680c:c483])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a5b3b62sm8594280d50.13.2026.11.15.18.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:00:07 -0800 (PST)
From: Ronald Ouyang <repaxan@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Ronald Ouyang <repaxan@gmail.com>
Subject: [PATCH v2] wifi: ath12k: set OFFLOAD_ENCAP_4ADDR on interface bringup
Date: Sun, 15 Nov 2026 17:59:55 -0800
Message-ID: <20261116015955.564420-1-repaxan@gmail.com>
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

I tried the WDS support added in https://lore.kernel.org/linux-wireless/20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com/.
With a ath12k WDS client, the frames received by the WDS AP had some extra bytes in the beginning of the frame.

My understanding of the problem:
1 - this is a WDS client, 4 address mode.
2 - on interface bringup (ath12k_mac_op_add_interface), it has OFFLOAD_ENCAP_ENABLED but not OFFLOAD_ENCAP_4ADDR.
    it picks software encap for this interface and it doesn't get rechecked later.
    so later on, it software encaps the ethernet frames and sends the resulting wifi frames to the vdev
3 - on vdev bringup (ath12k_mac_vdev_create -> ath12k_mac_update_vif_offload), it has OFFLOAD_ENCAP_ENABLED.
    so it expects to receive ethernet or "native wifi" frames.
    it also sets OFFLOAD_ENCAP_4ADDR but it's too late here
4 - the wifi frame encapsulated according to (2) gets passed to the vdev marked as "native wifi".
    it already had a QOS field in it, the vdev adds an extra one when doing the hardware encap

This fixes it by setting OFFLOAD_ENCAP_4ADDR during interface bringup.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Fixes: 729cad3c3c9e ("wifi: ath12k: Add 4-address mode support for eth offload")

Signed-off-by: Ronald Ouyang <repaxan@gmail.com>
---
Changes in v2:
- add explicit check for station and AP for consistency with ath12k_mac_update_vif_offload()
- clarify problem description slightly
- Link to v1: https://lore.kernel.org/linux-wireless/20261111215845.814490-1-repaxan@gmail.com/
---
 drivers/net/wireless/ath/ath12k/mac.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a247dcf387de..f0936f6c969e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10276,7 +10276,8 @@ static void ath12k_mac_update_vif_offload(struct ath12k_link_vif *arvif)
 	if (ret) {
 		ath12k_warn(ab, "failed to set vdev %d tx encap mode: %d\n",
 			    arvif->vdev_id, ret);
-		vif->offload_flags &= ~IEEE80211_OFFLOAD_ENCAP_ENABLED;
+		vif->offload_flags &= ~(IEEE80211_OFFLOAD_ENCAP_ENABLED |
+					IEEE80211_OFFLOAD_ENCAP_4ADDR);
 	}
 
 	if (vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED)
@@ -10940,6 +10941,11 @@ int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
 
 	vif->driver_flags |= IEEE80211_VIF_SUPPORTS_UAPSD;
 
+	if ((vif->type == NL80211_IFTYPE_STATION ||
+	     vif->type == NL80211_IFTYPE_AP) &&
+	    (vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED))
+		vif->offload_flags |= IEEE80211_OFFLOAD_ENCAP_4ADDR;
+
 	ath12k_mac_determine_vdev_type(vif, ahvif);
 
 	for_each_ar(ah, ar, i) {
-- 
2.56.1

