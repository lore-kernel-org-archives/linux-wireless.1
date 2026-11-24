Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795481983;
	b=N1vdhX3Q3v7Cvf+xjuCMiqt0jOrSarDOYRavPFittWwpMaPe+6rJBe5iplAOdU3u7UpG
	 Kgb3TMLkrsFNgXIv8QOi9maxXt+zLTX94od4xwFstUuOecnzyPlV+9s8/DIsdifimeppc
	 x1h9WrZKkAvhaFe/egbm+06fPICi0npk3DDTSRR7dIWRkncdb0TzUaKuSDokZTKsb7TYq
	 mMfIPMzfdtATaScbD2ibHpKg2iHQMvaKj67lri3cRInoAQ7Aul0x2FrLTD1bJZNsjxsok
	 FDr3mNOHq8ci0s7QzJwG/M5tGeONGZPNeAgasOIQsMLV9BlbLnclcBJJaRczefIo0fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795481983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tb+J4grrziNRGAo5T7DYul9U5wujwe9VyddWPwEAkYY=;
	b=sDpI1W1cGm/HTE1r47L0jhSWxcqFfbOqzm1XkQO0qv149K99i8ml6QsuC4zEXx01hRYC
	 MByWCFxEqdtL59j4MaWxuQO4Vb2s6HCId8HW5PsPD3FH6YWJvfhzuk9g1/hS52uzqMC5M
	 EqgN0BTOF8wyL2Z8j/nXi3QZpue0dJVa6fNR2rUnodycw/RET4J10eWqYDu74pCuqB3Px
	 vV+xZW1jrpqysZx+BhLtiQVM4h4DmnsSFmN02adDbGpQgYfddwcgRP9gfR1RZWravHc8F
	 z8DwYWP9VLcA5SNO22HUWjMfIkLwj/aAYhCBVjdPHV9lsQFfOBMLyJx+EosPJs6RPAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wek8TN7k;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF63606A693
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 00:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AF63606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wek8TN7k
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f09190e85fso2609925ad.3
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 16:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795481982; x=1796086782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tb+J4grrziNRGAo5T7DYul9U5wujwe9VyddWPwEAkYY=;
        b=Wek8TN7k5mzTTV1daBakIMoT6MI2Kiu4AGlfuzfehdioXNylj9hkrVTsl2I+KQ1u56
         wRS7P6IEcExGQxa0lXr2D4tGxM9ATqOUVaNrD3aB09lH8zyP5p/oxqzOyO12S+tMnp2E
         aI6iv8FvgkNWDdHzSr5BQenJg03x2Vk4rygPy9gRdJQTWH87ziEAgf/hiI6NtnPq7yKX
         q+wKskvSy5EO/mOomofYM7ms75ewbnBLJkdZ+rliqX1EFwOjJeW83h38/7wvumewBFjA
         hfVCepPElvo+9Ws0UgQTyV2kox2aotuwDdzweCQyLpS0WcJfaoOCFTUPXfGM5cL/sgRr
         YWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795481982; x=1796086782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tb+J4grrziNRGAo5T7DYul9U5wujwe9VyddWPwEAkYY=;
        b=S3yy4OYZNHbmcQlOhloxoHMgoF24WYiLxwQqqDd0ZhqZ7Ugld+zTeBGjlOY2cEDbJT
         cMQcgPJqksQpOwmNRvbIqh2rSXeID0ds6D2UxMyx5mgp8Mo3bdmNE8B7u/GXOtJ33w3B
         0N7+6pLRLYUaRDw0m9nD+owwyY+173gaPbAKzCixR5a1H7YDFwT1JUN3Nh6ye21B78T/
         /f8jWB/mTY/gDfrft32tT/B90CizI3znWd0nyIgKz0/V37bqDFupi2FY/BfefL6P38Wc
         77MDj1En4TYhbLtlVJCZ6JtQq9RNOabxlgITN6pl86E0kYyDg9tgRNS6R4Xn7bTfWRew
         oKsw==
X-Forwarded-Encrypted: i=1; AL+hErHpqjXurfMCDwumE1VRRKPPNMGq5ggC8YJKsZzshSqObW7+5nfm61XX/z2Mo+pKwZDNmVq6JFkLyS6AIppXIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9HB0qrCncgZ8YijA62+0TvEleXdrF59+KCYEIIug46+dKxQSaC
	6OwDptsN4zKIxJX+kZgB2YE5kwHyNwtE9IeTqJYnamHhf53umXj1f0yo
X-Gm-Gg: AZFdTZcZ0iFG57ggj6cyXxMW3/WEk0APTeqLFeHphi/MojLDfQpIIszgdq77op9VhtS
	KcNGmQOzUsQMpXIOqxXgVLQdEoMvl9W6nzY4MVL2T8VYgNBAFWDF9TmCfC5DsDPkXbZbLQLqgVL
	fP/wcM2WBu3TVKf8yphhiWjVHyU4nN5f/hP+UsYgr6XDTQ73HX8wwR1R18x6mUqIbRKb6HyIp0W
	y8P6ofbij2JXjlSDPTABHxDYWxlcwjMzM6ht1k62lmLdPYuhiSCNxbYBuI1Rvf8WsGAktztmTyp
	dY+VCwmbhzwdfGtM+hhcYJvJPy3+jxAt79zbP8Z7GyV5u+ZO/xQTaFELsC1fpxT4pwYoiHCWejC
	O9QoQN8BGi1d3FqoUHVh5UxqHPpu65fdhhGVbJshMTuvYrQi/UeNzSXDr0CUrqkco5uhzP+UxXp
	zWsXG+Nw2heegx5D5DVnB7UWtXpGOrzahVQxX9zrspnYVPsvBW5Zjf/XuSGGhbLXuiwPq/bAKzk
	vVaabVNP4r4lw2BH8r77fLjDDfReHBe4Z/EC1MY+AsB7cM5Ti9qqNuHZHz/Ot8Zvo9RzAOtE9BW
	Dn9CxwwD/p0v5/QxWC0NB59wWeqmVlsLxzQYzvZF/rLs20WKo52PXi5V4deZhoO4xMIInCf/ti/
	HJyRvsT5y3wyOqiE09d1NElB21O3WTYxcERHnAKfmIAkQy1VOoHcGH00E5Eu4Ot79ZoPufoqpo/
	4fx/dRaP0RE3E=
X-Received: by 2002:a17:90b:180b:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b41c7d0dcdmr20444551a91.1.1795481982478;
        Mon, 23 Nov 2026 16:59:42 -0800 (PST)
Received: from esteban.lan ([2001:f71:5160:2b00:ae2a:b9d5:71b7:3bb9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm22990964a91.1.2026.11.23.16.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:59:42 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Antoine Pichot <antoine.pichot@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Kemnade <andreas@kemnade.info>,
	stable@vger.kernel.org
Subject: [PATCH wireless 2/2] wifi: mwifiex: pcie: skip the card work once the adapter is gone
Date: Tue, 24 Nov 2026 09:59:32 +0900
Message-ID: <20261124005935.290010-3-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124005935.290010-1-antoine.pichot@gmail.com>
References: <20261124005935.290010-1-antoine.pichot@gmail.com>
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

The work can also find card->adapter NULL without remove(), when
firmware initialisation fails at probe or after a reset. Both paths end
in the failure path of _mwifiex_fw_dpc(), which clears card->adapter and
frees the adapter:

- At probe, a command timeout during the initialisation queues a dump
  and a reset. The failure path clears card->adapter during the dump and
  waits for the work in mwifiex_cleanup_pcie(). The work then reads NULL
  for the reset.

- After a reset started by the work, the failure path runs inside the
  work, and it skips cancel_work_sync() while a PCI reset is ongoing
  since commit 4add4d988f95 ("mwifiex: pcie: skip cancel_work_sync() on
  reset failure path"). A timeout during the failed initialisation
  queues the work again, and it runs after the adapter is freed, with
  card->adapter NULL.

[1] reports four crashes in the card work on a Surface Pro 3 after the
driver's recovery from a firmware failure. In the reporter's kernel
build, all four are the work dereferencing a NULL card->adapter: three
in the reset branch and one at the start of the dump. This patch was not
tested on that machine. On a Surface Book 2 the unpatched driver crashed
on the probe path.

Read card->adapter when the work starts and return if it is NULL.
When remove() or the probe failure path tears the driver down, the
pointer stays valid while the work runs, since both wait for the work
before freeing the adapter. Skip the reset if card->adapter was cleared
during the dump: a teardown is then in progress. Pair it with
WRITE_ONCE() where card->adapter is set and cleared.

Tested on the Surface Book 2 (kernel 7.3.4) with a debug change that
drops one command during firmware initialisation, so that the command
timeout queues a dump and a reset and the initialisation fails. After a
failed runtime reset, the work queued again by the timeout found
card->adapter NULL and returned. At probe, the failure path cleared
card->adapter during the dump and the work skipped the reset. No crash
or warning in either case.

Found, written and tested with an AI coding assistant (Claude Code with
Claude Opus 5.5) under my direction; I reviewed the patch and the test
results.

Link: https://github.com/linux-surface/linux-surface/issues/2350 [1]
Fixes: 3860e5e39532 ("mwifiex: move pcie_work and related variables inside card")
Cc: stable@vger.kernel.org
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/net/wireless/marvell/mwifiex/pcie.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/pcie.c b/drivers/net/wireless/marvell/mwifiex/pcie.c
index b63e6ac6e582..c4837102f0cd 100644
--- a/drivers/net/wireless/marvell/mwifiex/pcie.c
+++ b/drivers/net/wireless/marvell/mwifiex/pcie.c
@@ -2842,13 +2842,24 @@ static void mwifiex_pcie_work(struct work_struct *work)
 {
 	struct pcie_service_card *card =
 		container_of(work, struct pcie_service_card, work);
+	struct mwifiex_adapter *adapter = READ_ONCE(card->adapter);
+
+	/* The adapter is gone if a failed reset or probe has torn it
+	 * down.
+	 */
+	if (!adapter)
+		return;
 
 	if (test_and_clear_bit(MWIFIEX_IFACE_WORK_DEVICE_DUMP,
 			       &card->work_flags))
-		mwifiex_pcie_device_dump_work(card->adapter);
+		mwifiex_pcie_device_dump_work(adapter);
+	/* A teardown that started during the dump has cleared
+	 * card->adapter. Skip the reset, which would run into that
+	 * teardown.
+	 */
 	if (test_and_clear_bit(MWIFIEX_IFACE_WORK_CARD_RESET,
-			       &card->work_flags))
-		mwifiex_pcie_card_reset_work(card->adapter);
+			       &card->work_flags) && READ_ONCE(card->adapter))
+		mwifiex_pcie_card_reset_work(adapter);
 }
 
 /* This function dumps FW information */
@@ -3171,7 +3182,7 @@ static int mwifiex_register_dev(struct mwifiex_adapter *adapter)
 	struct pcie_service_card *card = adapter->card;
 
 	/* save adapter pointer in card */
-	card->adapter = adapter;
+	WRITE_ONCE(card->adapter, adapter);
 
 	if (mwifiex_pcie_request_irq(adapter))
 		return -1;
@@ -3215,7 +3226,7 @@ static void mwifiex_unregister_dev(struct mwifiex_adapter *adapter)
 		if (card->msi_enable)
 			pci_disable_msi(pdev);
 	}
-	card->adapter = NULL;
+	WRITE_ONCE(card->adapter, NULL);
 }
 
 /*
-- 
2.56.1

