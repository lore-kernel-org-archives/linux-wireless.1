Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.2.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573995;
	b=gVvib5oxibQkKJ0UyhxbbL2R3ty0W1Dz5zBx+EB7NNlfAmekhtmoyP13L0lNm53M+Vdt
	 cfF93KCrnm3LxzM0fMdPxZerx35iRHUJSsYt/MtjNelN8v+8soJd5DbsI7xgVhEajv2TN
	 ZMdb4sc1YFZY654efVp5bcsdCzmyoEBUjTO3VgE+bfFJpTwmAst9G3vFECztP0Q5hirkG
	 L0y96EACe8mquyMZVDL2jVSBqwCrQIhnpXnQrvhAWH+JQrRVc9WqZs/TZXI0Nv2NnoTXE
	 ddG4qYUZ3mTSn1xvyQM/k3RhdiYohBkO0cTaZ99moZwIiUfaXjmFdOS7SdEdjafMmaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573995;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Virus-Scanned;
	bh=aP1DiJ5FbHIbzI7C8MZbIwSIFDQhIzZILNhV22K/q7E=;
	b=UKVDlcXROqHGhRLaGEN7iAXHtobbh8yJLFVCjbcwEpSUaz58pLraUynKGnl3enVYnWA7
	 udeiQ4Wb0LMwGiMJMClB+lZ0LXuf+9G7ppm2Or4HWw9TnVQKn1pNw24+MsxdYLYt3l/Wz
	 poVxx7xYfU+ZArWMO7XPEk0seMtSKAL/WFGKoH3TUf7IHkO4RxTt4aD50vPQCLhwojGoW
	 woCkR+HkoMKlrshaoKOuA5RlSsLFj3/i+Yuh+yNOJDZ0VNv1cSgN030DMTRbZirn5UMBj
	 aY4iwfZ9ld0wK/bKDfMr+9SGX6Uwvh9FUk7f4wTziyeCSgnWqYvNmQLMQaIwhJzfCVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jxself.org;
	spf=pass smtp.mailfrom=jxself.org;
	dkim=pass header.d=jxself.org header.i=@jxself.org header.a=rsa-sha256 header.s=default2501 header.b=NVU2CFCR;
	arc=none smtp.remote-ip=188.40.2.6
Received: from www186.your-server.de (www186.your-server.de [188.40.2.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59C3606A32C
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 02:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D59C3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jxself.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jxself.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jxself.org header.i=@jxself.org header.a=rsa-sha256 header.s=default2501 header.b=NVU2CFCR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jxself.org;
	s=default2501; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=aP1DiJ5FbHIbzI7C8MZbIwSIFDQhIzZILNhV22K/q7E=; b=NVU2CFCRdHAiUv8n7iTZgQ0FW5
	7yWXUx2TC155ogwZdFu4j8rXeyPvsDtHkfe5hAoto0/ICTzdGzPPkt/Jq19bfRmaROn5UK+SA4A3F
	mCSqO+IfFYaE5zdxnVGO/kEe7OqAJfP0htYT328KY24+7aYZjbusBujF7GnjIk9knHeQKjlE82Kmm
	vZ1Kx0tUNo1+DqycV7bhjVqdR46u2J0d6d0qteOt8VJvgcIPpPlMXD9BuJhXjIL0w35pxRe8F07RV
	60zrQMDHazQ3KZCRM0EVspimT7+3rzGNeyZDqrGA37lVU0/JUdHRZ1K2pdej1MqoI0RM+sgyDcykJ
	SWwWUJ/Q==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www186.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <j@jxself.org>)
	id 1xW2ol-00078G-0Q;
	Wed, 25 Nov 2026 03:33:07 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <j@jxself.org>)
	id 1xW2oj-00008i-2F;
	Wed, 25 Nov 2026 03:33:06 +0100
From: Jason Self <j@jxself.org>
To: johannes@sipsolutions.net
Cc: Jason Self <j@jxself.org>,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless] wifi: mac80211: wake TXQs of all ACs with fewer HW queues than ACs
Date: Tue, 24 Nov 2026 18:32:55 -0800
Message-ID: <20261125023259.820308-1-j@jxself.org>
X-Mailer: git-send-email 2.43.0
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
X-Virus-Scanned: Clear (ClamAV 1.4.6/28193/Tue Nov 24 07:27:44 2026)

_ieee80211_wake_txqs() walks only one AC when the hardware has fewer
queues than ACs, but __ieee80211_wake_txqs() selects TXQs by AC, so only
AC_VO TXQs are woken. A dirty AC_BE TXQ then waits for a later frame.
With vt6656 and dynamic power save, this delayed pings by up to a minute.

Walk all ACs; with fewer queues than ACs they all map to queue 0.

Found and written with Claude Code, an AI coding assistant; tested on
hardware by the submitter.

Fixes: 21a5d4c3a45c ("mac80211: add stop/start logic for software TXQs")
Signed-off-by: Jason Self <j@jxself.org>
---
 net/mac80211/util.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index 44feb80274..442606a4ae 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -403,14 +403,10 @@ __acquires(&local->queue_stop_reason_lock)
 _ieee80211_wake_txqs(struct ieee80211_local *local, unsigned long *flags)
 {
 	struct ieee80211_sub_if_data *sdata;
-	int n_acs = IEEE80211_NUM_ACS;
 	int i;
 
 	rcu_read_lock();
 
-	if (local->hw.queues < IEEE80211_NUM_ACS)
-		n_acs = 1;
-
 	for (i = 0; i < local->hw.queues; i++) {
 		if (local->queue_stop_reasons[i])
 			continue;
@@ -419,7 +415,12 @@ _ieee80211_wake_txqs(struct ieee80211_local *local, unsigned long *flags)
 		list_for_each_entry_rcu(sdata, &local->interfaces, list) {
 			int ac;
 
-			for (ac = 0; ac < n_acs; ac++) {
+			/*
+			 * Walk all ACs even with fewer hardware queues than
+			 * ACs: they then all map to queue 0, and
+			 * __ieee80211_wake_txqs() selects TXQs by AC.
+			 */
+			for (ac = 0; ac < IEEE80211_NUM_ACS; ac++) {
 				int ac_queue = sdata->vif.hw_queue[ac];
 
 				if (ac_queue == i ||
-- 
2.43.0

