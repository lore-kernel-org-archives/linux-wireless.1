Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795327247;
	b=3wdHVFRhdoDiQZuDpyRsUUIzzZKEpfL+OoXq2N4CFCPWcNTLsE6J4dy8gcme7vr8Qowu
	 KBspZdDXar0FQhTNr2LmBjBqL4H1ICgSSHKiXZfAeMqTP8mWYuM58RZ4gOpQ22cx1jmct
	 4R0WjQ6O0+xVTUauG2rEnU80snjatHrViOFqYmAIkKkBLkB426Khn9AsiJ4LZPjzXn4p7
	 j0Ps5nfswYUp80c7k7wg9J04Y4/32kpsPqfc0PHlXLxD8Iyzey8C+rrQAjKZfJJ9CjCnS
	 69Hqhc7SOCGdAfD9uSnCnLZ1B3facgcVWtDXQWM+T1S1+2yR3ezukM+IvRfT1zZwlpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327247;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qPwbZpEOgHBZJtZKW4/WsJx/my/R9y793J2j7PdbGb8=;
	b=1xSH4c++ce8HsPB2xDU9IGd8NCLjiVdG1QKM4qP1576JDGme6U0IOO8M5VPdmehW6Jy/
	 71f0FxkB9ds6ATbSjzj7oLygs+nRbobpJbZfScJ+ERqUIgmOoirw39Iyu8EGHZw1ZGo/w
	 Q1Z9FtujvqJ/dhpemJCikIrHWE4eDhRSMiJAxvrwn8oYxg1uth17zqZA0XkO5RRa7kcQI
	 ODJLItbIsfXXB5cJd8LdnSl2wRXqt0sCyQimAZHOUpwBr8dpp7aLFqIkaJvwFptpJUPUs
	 d8lMuCvNgdsLnLnRFQJXYABHv/2UWcBA/S8vofKDpq6uLSXZRMG1YD1Hv4CISxsdO3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VlwYG7Af;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0447606A32A;
	Sun, 22 Nov 2026 06:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VlwYG7Af
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795327246;
	b=PlmcvE6ZOTrPMfXTuU+EGMVRDmzMvCxMVcoYjH3ql/CyqEx3DKwWdwtLLN8y0V/uARgw
	 +UuPp0zuuCIxtjXt+o4bekTBeuyfePi+wYqSN/Pqm1rHWShsgjC7vqKgMOar32TAeoUK0
	 OR98ixrRB3u9nHBzdDOq16ng+ypj3nM7ecFBLibNtIJrqyGRuX45hwpRLDMbBPTTPo6Qt
	 LF+YMgjCIUyzRHAMqMatbUeb5/8NzrHF9TxjFy/NGU22puVCJ96FDc0efSOqWkwFUP1fM
	 Yg7Sk4TiSYJD2SOCDLMWRH+UbuIq9OrgE+ctoLKi4GonFgfp1W/x2fwb1dgc0GqyvKA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795327246;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qPwbZpEOgHBZJtZKW4/WsJx/my/R9y793J2j7PdbGb8=;
	b=t0TYeeAUDyZvPhOZz1ig6lWa57Gyc62wAfaaCyoGX+BwsAhnH92o50OHxyCUYRcSMk0f
	 Azv0o+zs2E4e6zaBUWfyb4be+6KzrxRTc65PQvP5xkpXG/RJdHgl30+5LiVLo2pWFOzWz
	 rG+nJR44zD/arzvp5dV/zMR+gSHPwf/r18lcfdO/3BqYl81aNMhNInBzdOKHsUjqOZlSu
	 /SzqXh8RagmdTGJ7fP0X4NKMJDPFTMcuS+hnR5NZhonZGID3EaL2aJxCXGgN5LmhQHGMf
	 B3MdbwxDoaM1CSSNp4X9pV7Z1pcry+hcIJc1adc0cQIwsKSGZTvD2IO36xHBWzEvSLA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 258641F000C6;
	Sun, 22 Nov 2026 06:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795327246;
	bh=qPwbZpEOgHBZJtZKW4/WsJx/my/R9y793J2j7PdbGb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VlwYG7Afj3MBcHCI78fduRsh/AY3pGnVi1YHwUoqWnvfxaCmJYhZ2r3e4/XrMpvjo
	 c5XpWg06lxG/5othHfDVzc+9OnyC0S/CufTVV+jxA1za13sljyqvrn+hq1v6LkkIca
	 fJzZylsw+Bqk2HwMkx9J3IGUnd2RNn6nM08Tkf0cTnv/+PBUDMolTbaEzidaplcXlU
	 XsCJz3lWdLOr+cn3Mq0gB3G9pcikpzwJMCSmSiI31x38F2PCvQYWyHCtvz4BDq0J1/
	 TCXi1HkTxLiWnu9UBYN29HXIyq9ACVgPkVKZl6SjsJqhU0TiJd9jCoi6DnY02Gg+i+
	 eo9ZfJ01a+4MQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AD49F4BF7A;
	Sun, 22 Nov 2026 06:00:45 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Date: Sun, 22 Nov 2026 09:00:38 +0300
Subject: [PATCH rtw-next v2 1/2] wifi: rtl8xxxu: don't report frames sent
 without ACK as acked
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
Message-Id: <20261122-b4-tx-status-v2-1-bbfdbd880acf@proton.me>
References: <20261122-b4-tx-status-v2-0-bbfdbd880acf@proton.me>
In-Reply-To: <20261122-b4-tx-status-v2-0-bbfdbd880acf@proton.me>
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ping-Ke Shih <pkshih@realtek.com>, Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795327244; l=1116;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=h6bAHAMFOpj1IhPJ2DluIsvK0mURYFEXBxECpWk1+QY=;
 b=KBSOJIwcXE8mX8ebPNFIL+ro8lLsYELEy9gKfyk645dsMQxfhfMEdXqwbR+Y3dXG8C9YCptQ0
 u1PXSDMiCIsBUa5OeESGFPQ05sGd8itosh1/lTvNL6PzeNzvtJeB24e
X-Developer-Key: i=niko3x@proton.me; a=ed25519;
 pk=J4zNm2pudzQ/wF+pQ8xO+wW6jpcNa9EJ2C1g4DUAjhM=
X-Endpoint-Received: by B4 Relay for niko3x@proton.me/20261119 with
 auth_id=1575
X-Original-From: Ahmet Zeren <niko3x@proton.me>
Reply-To: niko3x@proton.me
Content-Transfer-Encoding: 7bit

From: Ahmet Zeren <niko3x@proton.me>

Every frame whose USB transfer succeeded is reported as acked, including
those sent with IEEE80211_TX_CTL_NO_ACK. Report these as
IEEE80211_TX_STAT_NOACK_TRANSMITTED instead.

Reviewed-by: Ping-Ke Shih <pkshih@realtek.com>
Signed-off-by: Ahmet Zeren <niko3x@proton.me>
---
 drivers/net/wireless/realtek/rtl8xxxu/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wireless/realtek/rtl8xxxu/core.c
index 604bb1e5b05..ab2818986cc 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
@@ -5167,8 +5167,12 @@ static void rtl8xxxu_tx_complete(struct urb *urb)
 	tx_info->status.rates[0].idx = -1;
 	tx_info->status.rates[0].count = 0;
 
-	if (!urb->status)
-		tx_info->flags |= IEEE80211_TX_STAT_ACK;
+	if (!urb->status) {
+		if (tx_info->flags & IEEE80211_TX_CTL_NO_ACK)
+			tx_info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
+		else
+			tx_info->flags |= IEEE80211_TX_STAT_ACK;
+	}
 
 	ieee80211_tx_status_irqsafe(hw, skb);
 

-- 
2.56.1


