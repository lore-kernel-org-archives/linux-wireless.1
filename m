Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795805608;
	b=ThJfsorhe6o/wD4up0s/3enebhMc0ejKHGI7OJmRwNdOnTKyRGauc2w494jAO0JqQ4fw
	 DuxBb7cvGkYFpvKo+YNIAlhYayRRyZNN1erb8zVeBTJOWbaOfsLiVt7zxnUPnsDEjqXpc
	 U0M3Rm6Qq4o4XvzWTyerB8Tkpm1rwgXD/ugQNNTdyd2B1TJmIy07ScsN3/3Hxh7rUWyGO
	 ZzH7SjkVCzF5jf2KBgubZu1D9uDxbnoGy7jBt1tG8aJNwxh5OSECp7vQiUffjT3vcbwKd
	 dq07up2UJW4YU3SfsAJ5uVy2JlKrY5r0bE+UunIGHaqMlWj/dqgFINeGBvNEPCBWwKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805608;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DkP+HiE+d/yFmXrDMcZtFEOeGlFVoUVQbGIFt7QZFNs=;
	b=eRSgflS7/No81NEIPyKsKx6/68TgzjwyF8oGDJeJqjIl+dN6RPcWwztyMIzGphItHUSE
	 rnemeJ+ck9iC55ZD750esu6c0Qs17fUDyswchePXLO321SkThpTTdEuMZxoATPL6UpWQY
	 e7Hy9VJ9iB+EqhxogIGPC/7c8vOG7RPWXYJzUNM1v3I639vD3OFHPvaBrFZNaJdefjr4K
	 mjdNW5PgZg6+lV+qoNrmPM9MMxHzmCe00b6MT3soahGw4xAEhgfFjE2keIn6YhvX4gIk0
	 Vo43kPLJqhRW4ONpO8n/K2F7WhqFOBzqnFwpvkiuLlJtECxtiDYLbPONQLX9/wOoU0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYLzCG4O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BE5606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 18:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYLzCG4O
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795805608;
	b=Jwhku+y/pQnpSo1VdeXePORkxAh4pp2tE1+3Am2E2Bq3FOHMSxlV+9cgUDUYGy2MxdED
	 PjAk0Hc4hVW9iwzI+6324gB/wTxl8hHu6bcS1PBCeETwOhVwL5avKea1t0lnz9fzxmvNF
	 3sh9iq5Xsia7Ho0TOd8zQc0iLrA1aqx0wjolPfT0ejtm/r9MW3wTVnVrYuR376y40MvBc
	 x1Z8mzss0j3KXY/McHoeq5w1uy54GhwDowk/vxxrX6a5duu9VAk9KkMXSGlxlsReygxGz
	 CO+oQnRMiwvJpa9UgaWkQNA/uoFkUUl8wr3w0jlDo9RdbsPbBcmodZynG0ub/1hci8Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795805608;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DkP+HiE+d/yFmXrDMcZtFEOeGlFVoUVQbGIFt7QZFNs=;
	b=PccfnRbvjUaYPuiRoqAmQo++d+YUwMR0A8aHA1sZZO540pyPCCI4iPdAPGix89H5amt+
	 HZhDVd/hZKsECk/7TiJH435KBEW5nJdj630ujj6YnSgQid3cVoZtRI/Z5IFyI5SH+DYQK
	 5LAxOEdP+CnSAJ93+exJEhhnsLHsuuvoG7bIWhlPq2Y5VdknsqWTw4RIuaOaO9owwvwGg
	 2NKWDSA+IGPml2I/vqLd0UeZN+szdjEq+xtnPDJ2iZIu3H3k6ijgEAxyfzli8RDJ0B0+F
	 aK3g6E68Ztxt8SKMwcJr+gH/JqUDg4eW3CiGBDjzwa4c7vA7/KH/S6DcjmGHFw8eDWg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C2C51F00893;
	Fri, 27 Nov 2026 18:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795805608;
	bh=DkP+HiE+d/yFmXrDMcZtFEOeGlFVoUVQbGIFt7QZFNs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bYLzCG4OCpSLiDEUn2ZJAg+YiNVsR86bDEQ1Biqen7Keo59xNy89kO6D0oQBgM8H1
	 mxV7tv9gII49dm+Hzjp+g6rqeqy3JiEK5tk1Jqe2VEZnzWtDndG+TqphsJC0dCD9wt
	 g+cC5E/Ptb+QT+QqeKz0hqUQNATUSMNjOjpzCa6W2UoFE5vKrVOjdJ6rmrModBvfoS
	 ulcZhCGDSLmglpy68rs0+CQzAWG230Eh1VYk/Q5KFPP6bT0L+sq8r2+GI3V9l3bydq
	 wznTF7aqs1FFdesdF225OeVssva/83FbQdnAshpy7l+gEN9PLXAeA3rJg4g3AYezFR
	 0dBYaSdT4CJDA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9D8914DD5F;
	Fri, 27 Nov 2026 18:53:18 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Date: Fri, 27 Nov 2026 21:53:17 +0300
Subject: [PATCH rtw-next 1/2] wifi: rtl8xxxu: limit max_rate_tries to what
 mac80211 can pass
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
Message-Id: <20261127-b4-rtl8xxxu-retry-v1-1-b263ab1e0d1b@proton.me>
References: <20261127-b4-rtl8xxxu-retry-v1-0-b263ab1e0d1b@proton.me>
In-Reply-To: <20261127-b4-rtl8xxxu-retry-v1-0-b263ab1e0d1b@proton.me>
To: Ping-Ke Shih <pkshih@realtek.com>, 
 Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, Luka Gejak <luka.gejak@linux.dev>, 
 Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795805597; l=1352;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=7rDvRyAZq7izG3XCkldF+vIaKytmFeA6a8qQUUZnYrU=;
 b=dCidGzEhc3O2c6oo19xVa5KgLvPHJFNtwGNZSII82xe0QqR1TDssQBY7/vMVjGbLPvWWj9MLM
 /UelML0INFcC3EOBI4HLrtk+QR0F8lBynIvCNNtQqIwU+Z/3ICsGAAo
X-Developer-Key: i=niko3x@proton.me; a=ed25519;
 pk=J4zNm2pudzQ/wF+pQ8xO+wW6jpcNa9EJ2C1g4DUAjhM=
X-Endpoint-Received: by B4 Relay for niko3x@proton.me/20261119 with
 auth_id=1575
X-Original-From: Ahmet Zeren <niko3x@proton.me>
Reply-To: niko3x@proton.me
Content-Transfer-Encoding: 7bit

From: Ahmet Zeren <niko3x@proton.me>

The retry count of a rate is a 5-bit field in mac80211, so it cannot
hold the 64 tries set as max_rate_tries. Radiotap retry counts above 30
wrap around: 31 retries fall back to the default retry limit and 40
retries become 8.

Limit max_rate_tries by IEEE80211_MAX_TX_RETRY as well.

Tested on RTL8192CU (0bda:8178) with injected frames to an absent
station, reading the retry count from the TX report: 31 and 40
requested retries are now capped at 30.

Fixes: b2ccb6a04761 ("wifi: rtl8xxxu: honour the retry count of injected frames on gen1 chips")
Signed-off-by: Ahmet Zeren <niko3x@proton.me>
---
 drivers/net/wireless/realtek/rtl8xxxu/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wireless/realtek/rtl8xxxu/core.c
index f10397294a5..c42bb3666c8 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
@@ -8131,7 +8131,7 @@ static int rtl8xxxu_probe(struct usb_interface *interface,
 	SET_IEEE80211_PERM_ADDR(hw, priv->mac_addr);
 
 	hw->extra_tx_headroom = priv->fops->tx_desc_size;
-	hw->max_rate_tries = TXDESC32_RETRY_LIMIT_MAX + 1;
+	hw->max_rate_tries = min(TXDESC32_RETRY_LIMIT_MAX + 1, IEEE80211_MAX_TX_RETRY);
 	ieee80211_hw_set(hw, SIGNAL_DBM);
 
 	/*

-- 
2.56.1


