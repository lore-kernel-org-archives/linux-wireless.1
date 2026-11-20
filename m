Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.36.144.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795206433;
	b=kGlm6VQKxL58wh+aJ9PVqV7dC0Hk3m+RYluQCWOvz49Yl6GzdYdwBJ6kFXFnkREIrMuR
	 CbJcde/Cv8nW/UDezUMaCsCsFwnTJCyBxvZCbNLhdZFkLc1k5h3MEY2Fuxu1oscCsarfj
	 UmjGUvKykFnkngUODD12ymKdawzQzkI2y1Ic6Rq+0RH1pzPVey9r/84VXhWOVlFJuXyyb
	 TBaZZ5EngQHivBDDxCSPILpcS0Hzwxb3m75Rm5nPbcDoJV1f08UKS5bqAqC/Vz3iFkSYK
	 ICV7AKSwr/zkhpjjBOmrsgpz0qJ2s6XPjAY/3a8JCB8n2xFeCAXIdrvqL6JJ5U7HEcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206433;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=ygmN3r0WEeLX6DGtC69ZpzRGLxQA3t62Ryb7M9rweoY=;
	b=ofDt7Fasm6HqgcQHwVOdVoUjUgVTVR9K+S0lGsGMLo8DbXBNTYxBDG1ZENCgKk04kMV0
	 9H5isGbxJuaqgiuIH/eYSYJ9+iHasti9A8Nv5swEJTlsjg/xKgw0VtkGvBawKj3olD9+X
	 aXgNp1wo2k+SbSBV33O9Il+9L2jkQFGtaTsPlOQODZ/0ydg/zJYz4nMEyA8+mDodAd7eH
	 3wWEflOeIq6GSEAGgqWkTYm8IuCiayz4iaoRMb69IW++CB1w7hairKlinPhClNRrd7Cf+
	 ZsCbiFQM7brvpJvIGymnTgNi8pv+2ezh7DPWimse0MLCjs6bbDqTk2fWcBjBnU38xDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yoxcu.de;
	spf=pass smtp.mailfrom=yoxcu.de;
	dkim=pass header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=fiIOmlyt;
	arc=none smtp.remote-ip=194.36.144.171
Received: from morty.yoxcu.de (morty.yoxcu.de [194.36.144.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181E8606A6DC;
	Fri, 20 Nov 2026 20:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 181E8606A6DC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=fiIOmlyt
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC5071D87186;
	Fri, 20 Nov 2026 21:27:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoxcu.de; s=dkim;
	t=1795206428; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ygmN3r0WEeLX6DGtC69ZpzRGLxQA3t62Ryb7M9rweoY=;
	b=fiIOmlytp4O/9z7iUBl1WaxyrWzOwxHoVeDJvu2eJdRMuhgTGXO09Jfn5w6Apq9d7Drm6s
	pRYNV5A7vhESFzmF8rvCXszPDbjK92H7hxBQuWwso5qW8hPf5tid3NoqO1C2rvdpWHHtGc
	QiyJYVot+fUXwQJ2vFMsrvBhR1N/FK7Nm8FP3mg9obbMgZIwUU15TsneYhtDrglW2KrG/J
	GlPbSINeufRUvi8HZsK2rW8JTV+MZd8UfskdGMqxUYqR8WgGHp8uJWWwfdPEpCRPcDBb1v
	J1Nfs5Wq66IMe8486bDTaQ+DRPVcAmYjNW1WAOsr141Be013PI3Ok3hahWyLmg==
From: Michael Auer <mick@yoxcu.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Auer <mick@yoxcu.de>
Subject: [PATCH 2/2] wifi: ath10k: report WoW wakeups to the PM core
Date: Fri, 20 Nov 2026 21:26:52 +0100
Message-ID: <20261120202652.344435-3-mick@yoxcu.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120202652.344435-1-mick@yoxcu.de>
References: <20261120202652.344435-1-mick@yoxcu.de>
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

On a OnePlus 6 the wakeup source of the WLAN device now counts WoW
wakeups, and powerdevil keeps the display off for them.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.2.0.c8-00050-QCAHLSWMTPLZ-1

Signed-off-by: Michael Auer <mick@yoxcu.de>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index eca6bb189577..c171cd96ac6f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4675,6 +4675,10 @@ void ath10k_wmi_event_wow_wakeup_host(struct ath10k *ar, struct sk_buff *skb)
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI, "wow wakeup host reason %d %s\n",
 		   ev.wake_reason, wow_reason(ev.wake_reason));
+
+	/* UNSPECIFIED: the host resumed for another reason */
+	if (ev.wake_reason != WOW_REASON_UNSPECIFIED)
+		pm_wakeup_event(ar->dev, 0);
 }
 
 void ath10k_wmi_event_dcs_interference(struct ath10k *ar, struct sk_buff *skb)
-- 
2.43.0

