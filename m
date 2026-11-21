Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.36.144.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795269709;
	b=ItSK8lcDv0EOkl79qu7+a+76SZ1hUTz7YH0ijeAWJPfh9POcSV6IqCcPzHNLlp346/XH
	 y6Wnfb3wd7HUjn5ExnaW5/js2usMyaLygdb2dOCePeaQfO1LdRs8VA96gADxv1iJ1QXYV
	 XVcAIYiqtxPZVLsTuGC5rSdyX6fjgeX9XRTUpvB+31nPMD2P3+Xzvvqx4IT6a0kjiXHCS
	 B8rk/in5ZC11DcHGbkDz1c8yTq4U8H2fPrXUm0aQwsSxlUPQOiWL8Vwbd+pjwM+JRxeJV
	 QlXP3cj1hge5FNH7sttQi9JvKpujFhMqT3nAx++s9droaLoKE1vAGIpxZuDBrNPsEpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795269709;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=K/Wo0R+OjnTrHGNQDSRAHLdJd0werIg4nBYa+IDEEyk=;
	b=zzCWzBOWpF9/lCqZS8a1lxBOwnbM5O+GwgrLe/eb/HJyOHiNFyRXPtN099sGgjh5taiX
	 0uZWTFEP9FhIbK+UL6pl1rzG0hRDQbgjR0VN4MOOLcfUzIvW0n1UMJy0SokBsLBQDDYLD
	 HZpGFu7I1qzOkBo9NOKcdRkvJzdkaGO7FVlE1FBUDS0V3Nu6IHUoKSISneai5Gud59SLV
	 vphaSpqPdrL6NO8cKl9usIiDjKIO/Jlw5rUZlWRJFKSVTqt3HwtJ3y6JWQLOFmXdA5zzo
	 FoVTijtpJ6c1bj1MNnReWuvMkvg4JTC+LxwbaPe2cGRJX2FRZka95X1fKp8bqR8hg0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yoxcu.de;
	spf=pass smtp.mailfrom=yoxcu.de;
	dkim=pass header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=spEedUmo;
	arc=none smtp.remote-ip=194.36.144.171
Received: from morty.yoxcu.de (morty.yoxcu.de [194.36.144.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAA5606A68B;
	Sat, 21 Nov 2026 14:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDAA5606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=spEedUmo
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E5BE1D87228;
	Sat, 21 Nov 2026 15:01:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoxcu.de; s=dkim;
	t=1795269707; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=K/Wo0R+OjnTrHGNQDSRAHLdJd0werIg4nBYa+IDEEyk=;
	b=spEedUmoUZAYXL8Vos3lxelbHdCGMz2UZIAvcCacGD0UtAdTaqmPZG7vX7QSboPtXXIPg4
	+d3cbN0gB2T5OwFL9l9U6nKmKtzK4I/pieAFdpp+UYGin4MtEwHeOUWa/Jeu2/l56qiWWY
	omQY0eF7y+sVQFJK/k4ZIZZQe9qWucacnMtuPAY9oz9Ql/OUIF5+y3Aa5RoC3p0dv6JHjd
	LjAAGoSpvUY9LYgjewY/q3ZxY9z+tGR1AGwixlbFEp00HNqe1BVhDJ+Q0it3ZDP/TZZrBu
	mzpAmx+E6mkpEVVT4GhBCuorkXSehnEs/mm00T1Hz3lvTcXBqqGglb1KHYG2xQ==
From: Michael Auer <mick@yoxcu.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Auer <mick@yoxcu.de>
Subject: [PATCH v2 2/2] wifi: ath10k: report WoW wakeups to the PM core
Date: Sat, 21 Nov 2026 15:01:35 +0100
Message-ID: <20261121140135.709615-3-mick@yoxcu.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121140135.709615-1-mick@yoxcu.de>
References: <20261121140135.709615-1-mick@yoxcu.de>
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
X-Last-TLS-Session-Version: TLSv1.3

ath10k does not report a WoW wakeup to the PM core, so the wakeup
source of the device never counts it, and user space cannot tell a
network wakeup from other resumes. Plasma's powerdevil, for example,
checks the wakeup_count of each wakeup source after resume. It keeps
the display off after a network wakeup and turns it on otherwise.

Call pm_wakeup_event() when the firmware reports a wake reason other
than WOW_REASON_UNSPECIFIED, which it uses when the host resumed for
another reason. iwlwifi does the same since commit 06ae2ad413d2
("iwlwifi: mvm: report wakeup for wowlan").

Report it before completing wow.wakeup_completed. Once the resume path
continues, the system resume can finish and stop counting wakeup
events before the report.

On a OnePlus 6 the wakeup source of the WLAN device now counts WoW
wakeups, and powerdevil keeps the display off for them.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.2.0.c8-00050-QCAHLSWMTPLZ-1

Signed-off-by: Michael Auer <mick@yoxcu.de>
---
v2: report the wakeup before complete(), also on the parse error path

 drivers/net/wireless/ath/ath10k/wmi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index eca6bb189577..e12fdd5aabc8 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4665,16 +4665,23 @@ void ath10k_wmi_event_wow_wakeup_host(struct ath10k *ar, struct sk_buff *skb)
 	struct wmi_wow_ev_arg ev = {};
 	int ret;
 
-	complete(&ar->wow.wakeup_completed);
-
 	ret = ath10k_wmi_pull_wow_event(ar, skb, &ev);
 	if (ret) {
 		ath10k_warn(ar, "failed to parse wow wakeup event: %d\n", ret);
-		return;
+		goto out;
 	}
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI, "wow wakeup host reason %d %s\n",
 		   ev.wake_reason, wow_reason(ev.wake_reason));
+
+	/* UNSPECIFIED: the host resumed for another reason. Report before
+	 * the completion, so the system resume cannot finish first.
+	 */
+	if (ev.wake_reason != WOW_REASON_UNSPECIFIED)
+		pm_wakeup_event(ar->dev, 0);
+
+out:
+	complete(&ar->wow.wakeup_completed);
 }
 
 void ath10k_wmi_event_dcs_interference(struct ath10k *ar, struct sk_buff *skb)
-- 
2.43.0

