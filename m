Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795805610;
	b=ceSnZLMDSzcefN6wcIISqM5SRzpcAr0Ht3z3KGLjvwMi3sG1Jt+ZfU5BQ9+f7CGKcwqm
	 AawImOs0EiwMycJ9QUw95XuLp2XER/JSBlCTlehQw/GIXrwyOn6E/HREfjv6DPvP5KoxA
	 HLqTZrwJXZq84dURCg8lvSsgB4ud2m1128WDiJuqE9+vsVCReZjhAMjnit6X32VLCyTvU
	 2ImsRiLrsmGJBSx/Upwpv9PGhx3TXnWzPUpF/IEO0GGdD+xTU5oiNsSSqEinQ/44BX5JY
	 bow939hbvbVHW/M4BDiXsEy1Zw+8ZXCNahbWTNNCiXiFKwayWdj+yqxRzukItQK2lWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805610;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Pxf7sZ9D7yqtbvhCXHFopMV0bfMlrS+MOC7fjwxqEC8=;
	b=K6cs8O7Kg9TchXAgkZAjsXsIc5EckAvoGa9Wk0Pk6xs+Ahnd6mwFbSc7zBz5zyjbtxWy
	 USKkv9DXZWVhBA3NGd9APHPLKfIiGt6bl1yBRjBk21GfvrvYD6ODWGSJ1TLlqw0y63wda
	 /XEx7raG38krszRYE0bvLNN4TKOTYyHSPVNsDj0kA5UHPQPw51qK8oVv4CPyCZDOEfXdP
	 HjD4N2mnOtadBIfNnhNw6og0J3sBGljmoPyrWRUKHifp4g8PdbV7/HuxbbpnHa7Th4fFo
	 AMlU4MsstntnmoKeEmbi0anG+jqS9BqRxz//t3465X3qXh2cOYeP7b7N3zj556INI8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nf8LKPTO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E9F606A31E
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 18:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nf8LKPTO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795805610;
	b=Gqg+Kcv2fmvjS0iKOn1Hz5GQS+XDWo2D23SXeqS40Qja/RmcVNRiUEaZwM7DgWBEPoEt
	 PcTh9Wv7n6tNTeVMelIyGB0Wv7M1VOIxoqAlMnEC1Q0Hlz3029vB+Km8FvXkCoHKqqq3A
	 nOi46No4H1uDq/LxCjzaTFOpqNM8oBF7zDCUqc65d42AgnLfi2BFYo6RxAUiT4jZSa0om
	 nAnQxGO8Uvvmur2UvRU9S5+4G2PcN6D58MTvx5i/bIOBoSrXkGayH2fM8EcUJegDLNguQ
	 GKJRXU2q+Ljf4PYJvnNVOqcUN3Qrz9xzCb5xGBocybGm99C6d1HqN1u+ZdPbTjfclWw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795805610;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Pxf7sZ9D7yqtbvhCXHFopMV0bfMlrS+MOC7fjwxqEC8=;
	b=bQCD+zk/LsOReYT/AgGju7PVngKn7Ye+5V/KvRVhH8iaMRdxRCAWxJh2I2x4t/hQfEdV
	 R0w/1Yf3NBcnZTTFMj3bbujHcKzDORRBpsUdo/JcCCr0RlOXsG3uWL1P3WqWzV1bzyL9n
	 Sfb4w7yQAiDY+DOqLahIpJzU/CZ4gjWMh8YusQtRUjYmarvoxsrVqasTDrPY+fZrpsc6Q
	 z6rMQSAyBDwUIjZPJwbUVkMtIircwFK8AWpbpuDaLFceLdwFi6/ZEBTL7UUd7pec+SVI3
	 Gd0/It69JEb6g3rSKaB5eJoaLIjItFSyNtCjxsbJIHZVXwgW4trkupZcs18jR3PcE6A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A2351F00898;
	Fri, 27 Nov 2026 18:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795805610;
	bh=Pxf7sZ9D7yqtbvhCXHFopMV0bfMlrS+MOC7fjwxqEC8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nf8LKPTOmLkNFxskObR6VqBsgwajmO1uKDqcBNbLQtT4DvuCRi8O4l5SNa7XQ/Q4I
	 w6Zkc1LMmeM5x6Mk35vslxRpGKgiA5nTUrkeSQE0Z5W6wzzItA0K9WMNCNP7D3dGv+
	 SvKipQYJVKn93Sq8j2yS/KaxDrETl9qhkGSo2mF0m/IduzFbX677hRFoLgvb+yeczN
	 pIPE4ZiBNHv7q0cM4dxz2DRCyCFoLXcYImQdYT/W3/JM7+0m54Yz6g83yK/uHn4qwf
	 8Zhh7bn2Q1lviUfQZDML1m9ajfL5yOAo+UbnyCltHE33YKIJQq/7vOVBQwbg6ibfk2
	 PEYhP+uqIZF5Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BD4DD4DD66;
	Fri, 27 Nov 2026 18:53:18 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Date: Fri, 27 Nov 2026 21:53:18 +0300
Subject: [PATCH rtw-next 2/2] wifi: rtl8xxxu: limit the retry count in the
 TX report
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
Message-Id: <20261127-b4-rtl8xxxu-retry-v1-2-b263ab1e0d1b@proton.me>
References: <20261127-b4-rtl8xxxu-retry-v1-0-b263ab1e0d1b@proton.me>
In-Reply-To: <20261127-b4-rtl8xxxu-retry-v1-0-b263ab1e0d1b@proton.me>
To: Ping-Ke Shih <pkshih@realtek.com>, 
 Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, Luka Gejak <luka.gejak@linux.dev>, 
 Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795805597; l=1373;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=p5FTsoJ9noLxhCIkMxA45ERXVm6ZAc1DxPHWHtYohRo=;
 b=LbC6WJwlYG4iyCD+M6OcUCwlabMQbxV3vWe7zLF4t4FW68uBBzN3fBUdrdGvbR39mso3aHzIl
 D6Mt9Rlr5EXCYoRVqfC7vlHT29QGhVospjLPCdE0O4G2zbrSmqJREJm
X-Developer-Key: i=niko3x@proton.me; a=ed25519;
 pk=J4zNm2pudzQ/wF+pQ8xO+wW6jpcNa9EJ2C1g4DUAjhM=
X-Endpoint-Received: by B4 Relay for niko3x@proton.me/20261119 with
 auth_id=1575
X-Original-From: Ahmet Zeren <niko3x@proton.me>
Reply-To: niko3x@proton.me
Content-Transfer-Encoding: 7bit

From: Ahmet Zeren <niko3x@proton.me>

The CCX TX report has a 6-bit retry count, but the count passed to
mac80211 is only 5 bits wide. A frame sent with the default retry limit
of 48 is reported with 16 retries.

Limit the reported count to IEEE80211_MAX_TX_RETRY.

Tested on RTL8192CU (0bda:8178): a frame to an absent station sent with
the default retry limit is now reported with 30 retries instead of 16.

Fixes: 8b29fd95e2d3 ("wifi: rtl8xxxu: report real TX status on RTL8188CU/RTL8192CU")
Signed-off-by: Ahmet Zeren <niko3x@proton.me>
---
 drivers/net/wireless/realtek/rtl8xxxu/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wireless/realtek/rtl8xxxu/core.c
index c42bb3666c8..f923983bd44 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
@@ -5240,7 +5240,8 @@ static void rtl8xxxu_tx_report_poll_work(struct work_struct *work)
 	ieee80211_tx_info_clear_status(tx_info);
 	if (!(tx_info->flags & IEEE80211_TX_CTL_INJECTED))
 		tx_info->status.rates[0].idx = -1;
-	tx_info->status.rates[0].count = (retry & CCX_RETRY_CNT_MASK) + 1;
+	tx_info->status.rates[0].count = min((retry & CCX_RETRY_CNT_MASK) + 1,
+					     IEEE80211_MAX_TX_RETRY);
 	if (status & CCX_PKT_OK)
 		tx_info->flags |= IEEE80211_TX_STAT_ACK;
 

-- 
2.56.1


