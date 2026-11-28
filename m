Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795897856;
	b=fwnZQXS4n3ReXyG9V5Vt6uTKdBEbrLKx/NyEDvNh9eqK0v9NR/PoRU0rLtkBtdqRxMnN
	 ZvlW0xcOGNaBDAYXQASJN+ZSHr4hEd2IC/arpUYir4cGJjlLi064lyekrG/vYzdHX1b24
	 fm1VQSi1PLGWPiIGu8Dxbh55ueOwX0eaLZo04+QuAvIY2cMm33euctygZFQlA7rQjzSNn
	 zBygswlQUzAfjmkZb1lLTIGLVRLClrUevIZ+qX9O0LY8WbKY8lOx0/TT/z8CzdC6bVpfA
	 8YIU7k4ZP2wynn6fUaIYyR8T9MHeVv8ANgGBw9dxUhEtcsXHGa1KMGgMIm8sfCb0evQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795897856;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=d9O+XyIyNGj3TCdOizAXGIQw9TCOaevUuwhgRcfaS78=;
	b=zZUrXk1F4CigqlYoxGTK5qIyOujR3MSNKN8eEGZoNH86hnUTOn267fut1hlClTNANxTG
	 3e3q9sPQKAi8td+biVy5Gf3DYUt80Ea/lp/p6vBbLSTt4ZFQHcDqDkDl2sE3LkyIqa/Yd
	 EAeZA38eRnlNO1XhLvJJzYB2Em/Knoku/qUUQcxDFGwTf23g4lCeU7fMDT10WFlAUHzKq
	 JM4ioQKpXYleDDaoLcxPc4p79fXlooKacALVbYmiB5mpe6HvDWO6PSGAsUfV5uwaumDTE
	 g86WOKYB5CdU02uPMY9O5aamZY6AFcCfAz+O6mEIQ1UyryWIXt2nMY3yUe11ehd/yvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DOWSw02M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042BA606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 20:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DOWSw02M
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795897855;
	b=qC33Y87AU1198rdy/JvbaeXmVJXcJta/EwTTQaWcFi2ExtzCXJOEo0Jo5dAWUwpPVMQR
	 YuirpkbIieYCSj65c7YHzVfGEcAaxMp2JWYXVLClZYNQdhliA1Y+deOmXtpW1a6v7gdnS
	 WwNuZ+ZcXTbCK+00hnVmqweu8qmCbDwlsU2fxOaR1aoT/4Z+qWIqi7Ujg6Kn7uv0JncIL
	 1pOf2Z5eME9sx1WfzyskKS+lqvZ7mtgo7f/H1jd1qb0YtxSKjRSgTJv8fscXe+NFod9i6
	 pzsC5ZH0u+026E0Lq3GLypYflnWi6R3paUBPmX9mtQNauaeN8OLTGKTkcS2mljuRy3w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795897855;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=d9O+XyIyNGj3TCdOizAXGIQw9TCOaevUuwhgRcfaS78=;
	b=UURCHXWaYbrPULgL660KXiZEeQ7IW8OisbYqEAoPRAnf3juQGkjAFKYwLH0o7FqslLVp
	 Cy0uTDjwcj7lUVFqlEAkhfXJ9yPE0hf8v+sp8QLZxeXtfZgw1mdDw///+8w7fuwo1+Fp+
	 5hZpWvwG8O0+pslkzLhg9Rn/4i427sJr/mgDCTRewN8alBZNxZuQG6zBsuj6FubET+s1w
	 B0PhmxHh1jS61XWcxS8CCwb+Yt8KuA0SXHx28SRaAlYQ9isNru//EEZlRrNckq6nih5E1
	 sMxUmVwLIX6X+3OAHCRy0HPDnZUkw33ZYVx8OKBLYgqSHGIoThlTcZUAlXtZLGNePAA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A3DA1F000C1;
	Sat, 28 Nov 2026 20:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795897855;
	bh=d9O+XyIyNGj3TCdOizAXGIQw9TCOaevUuwhgRcfaS78=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=DOWSw02MNRHJ/P8jRohRx/F7O9tCZ9K5Nj+2wB5Ip0CgOC/x1xN9J29knITRMIRM5
	 4hvh7fNvIFG4552nblMR8kZCMkO1pz0wEYDiJ1eqOB3kDkMItBRvGs5jcOHI3/7DRu
	 AulsjXGGrApj0Tf1kskYscpbl2WYDrva4DQYaMAjrg/OCl/x0eeO/LzR43sGvP4zsC
	 1dbKIWapajOrrVnvxb4HANmNMhQXHpBYS8EyJdRAN6DUqHhxXV4LRtN8OSn8wDX5or
	 g/2NYA1j+4ss25Ha+7yx8pUCBIPKDTXMejhQvSCEg2kfBgsdNZyvxXqD/i4zQOpUgm
	 npFu7FFooaP8A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BCB694E21B;
	Sat, 28 Nov 2026 20:30:54 +0000 (UTC)
From: Orel Fichman via B4 Relay <devnull+orelmz.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 22:30:35 +0200
Subject: [PATCH] wifi: ath10k: reset TXBF before taking the vdev down on
 disassoc
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261128-ath10k-txbf-disassoc-v1-1-c714edd639a3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1g2YYEvpVUoX4yRqFLRMpkUQ7
 +60Lt/i/w1ck6nDo9og6dfclrmALhXEIcy9okkxcM03Ir5jyAPVE+a17VDMg/sSUVnkShoajgI
 lfSftbP1vn6/T/mlHjfn3gn0/ADMLUk94AAAA
X-Change-ID: 20261128-ath10k-txbf-disassoc-e2dd51ea42cd
To: Jeff Johnson <jjohnson@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 "Claude Opus 5.5" <noreply@anthropic.com>, Orel Fichman <orelmz@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795897854; l=2596;
 i=orelmz@gmail.com; s=20261128; h=from:subject:message-id;
 bh=SdDEtslTVtzP5XubbEBuJRKOLY+v1lLUgiIWwZ7DBkc=;
 b=UwdGdB61aLmBiaNoIpMPUVKCKYFPgXB2be87YRbLJg34XO3w3imcEcE5Zsdmu1bOT8flHk1Dy
 LTkv4rgv2zUD2RGHuW0UmVLG5hQLlXoXop9cCZUCuIr9h0J7GBCPc7K
X-Developer-Key: i=orelmz@gmail.com; a=ed25519;
 pk=V/0LisYOqumnXjWepsPmrdFQvGO2Ne5eOAuTPmK2yMQ=
X-Endpoint-Received: by B4 Relay for orelmz@gmail.com/20261128 with
 auth_id=1679
X-Original-From: Orel Fichman <orelmz@gmail.com>
Reply-To: orelmz@gmail.com
Content-Transfer-Encoding: 7bit

From: Orel Fichman <orelmz@gmail.com>

On WCN3990 with firmware WLAN.HL.1.0.1 (SDM630, Nokia 6.1), every
disconnect crashes the WLAN firmware, which takes the modem down with
it:

  qcom-q6v5-mss 4080000.remoteproc: fatal error received: err_qdi.c:459:EX:wlan_process:1:WLAN RT:3082:PC=b00c9af4

ath10k_bss_disassoc() resets the TXBF vdev param after
ath10k_wmi_vdev_down(), and this firmware does not cope with TXBF being
changed on a vdev that is down. Reset it first and only then bring the
vdev down. A failed reset no longer skips the rest of the teardown.

The crash was tracked down and the fix written with the help of Claude,
an AI assistant, in an interactive debugging session on the device.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.1.0.1.c2-00717-QCAHLSWMTPLZ-1

Co-authored-by: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Orel Fichman <orelmz@gmail.com>
---
Tested by disconnecting/reconnecting and toggling the radio repeatedly:
the firmware crashed on every disconnect before this change and never
after it.
Only tested on WCN3990; on other chips this just moves an existing vdev param update ahead of vdev down.
---
 drivers/net/wireless/ath/ath10k/mac.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8e604697d..fe9e7c20f 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3198,6 +3198,14 @@ static void ath10k_bss_disassoc(struct ieee80211_hw *hw,
 	ath10k_dbg(ar, ATH10K_DBG_MAC, "mac vdev %i disassoc bssid %pM\n",
 		   arvif->vdev_id, arvif->bssid);
 
+	/* Some firmware (e.g. WCN3990 WLAN.HL.1.0.1) crashes if TXBF is
+	 * changed on a vdev that is down, so reset it first.
+	 */
+	ret = ath10k_mac_vif_recalc_txbf(ar, vif, vht_cap);
+	if (ret)
+		ath10k_warn(ar, "failed to recalc txbf for vdev %i: %d\n",
+			    arvif->vdev_id, ret);
+
 	ret = ath10k_wmi_vdev_down(ar, arvif->vdev_id);
 	if (ret)
 		ath10k_warn(ar, "failed to down vdev %i: %d\n",
@@ -3205,13 +3213,6 @@ static void ath10k_bss_disassoc(struct ieee80211_hw *hw,
 
 	arvif->def_wep_key_idx = -1;
 
-	ret = ath10k_mac_vif_recalc_txbf(ar, vif, vht_cap);
-	if (ret) {
-		ath10k_warn(ar, "failed to recalc txbf for vdev %i: %d\n",
-			    arvif->vdev_id, ret);
-		return;
-	}
-
 	arvif->is_up = false;
 
 	ath10k_mac_txpower_recalc(ar);

---
base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
change-id: 20261128-ath10k-txbf-disassoc-e2dd51ea42cd

Best regards,
--  
Orel Fichman <orelmz@gmail.com>


