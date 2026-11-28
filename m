Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795873059;
	b=XcjvJO2fjblncEmTKLADEFAgR7DrPg9Q2CPLsLOlY5xmdo3+A7Dos7yrsAcMCjTNHpf9
	 gle5Tm5WMLfWxJcOMEFY4OsQDhoqXYIYfjV4VXXUiBNbSf3EUww/HKkEgBFqv5CRuq6ut
	 7COfW7PrreaUpGX0FuVyhblzXv7fTqyd3zzONMBhkBJRFLob2jm79xhEN43TWWFzVWP83
	 Y3GF0rp3gKhCflQgJ21qyk3WXI6P/TXvIvAOm9kQvFQKpkJwNHjv7W3eubG1yfbM1x85y
	 g1ZR9XHvlmQ8119vnJg416LsXKt2zU9h/bQMPecFQRvHiW2nqloKjnLaNYpaJzaFrPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873059;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=h8CmeOBv2yb0Y1TEIgTmHQbtyrvnayhKHuErHuFUKkY=;
	b=wYnZVnabNPpOvLSQMH4+/NPxK/vq4Lx2CBHF54To4yb5euffhG3nyKq4/Zk2+GmvMQz8
	 SVi7/jXsBo3WQpQnWCB6qBaEM9haMgvBHE6v3U/Z+3V07HtUBvOkKn9ACaOPYbZl2w9+q
	 sNETYgI1nbgnycwC6gYsqUU4YJ5lZutOlQA5oyVD5yJ6jGES2zr6VrgVEi4Q6/GETDyta
	 hhKQuZHRXkRoDSB1KURzXtsPJERm1VxVtKSgt6LcHwUqFLRP5wjcObdqkGiS57wUiFZV9
	 0Y7IgauYhEjRwR/sOAMhUy/VaaxE6N2C3eHpqm98rUR+xCouFELSC6GjFjPQtkG7HhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RXyGpok5;
	arc=none smtp.remote-ip=95.215.58.50
Received: from mta1.migadu.com (out-50.mta1.migadu.com [95.215.58.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77480606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 13:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77480606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RXyGpok5
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h8CmeOBv2yb0Y1TEIgTmHQbtyrvnayhKHuErHuFUKkY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795873055; v=1; x=1796477855;
 b=RXyGpok5d2/III3Wj/KqUJDC472B1rBKXrTCuTH/cG52c3YcVibFPgohPy8VGZQ1jflf88i6
 vWJQ8Z7UaXKylRxsBAH/ITLQ5yzeLnMkV84BB3adnku43s5rVeWYysPnwgex8LCBYNq9XwOMcml
 c+vygVczBrjNPrwGRwuTiYHI=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1b680558c3a0b1f4;
	Sat, 28 Nov 2026 13:37:35 +0000
X-Mizu-Trace-ID: 1b680558c3a0b1f4
X-Migadu-Flow: FLOW_OUT
Date: Sat, 28 Nov 2026 14:37:33 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: martin@rfdeck.de
CC: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>
Subject: =?US-ASCII?Q?Re=3A_wifi=3A_rtw88=3A_usb=3A_AP_sends_no_beaco?=
 =?US-ASCII?Q?ns_after_monitor_capture_on_the_same_phy?=
In-Reply-To: <20261127201403.Horde.ivCdJn-MZnrp2I8iyRVNzlp@mail.your-server.de>
References: <20261124144427.Horde.qQ_UTCx-6LmjjeS1bojTj8-@mail.your-server.de> <D34D5E6B-B159-4F34-92D8-4264024D3319@linux.dev> <20261126081256.Horde.ilxldEFeRo6UQJajd_7Nd6S@mail.your-server.de> <a0827be820914280cca81b32b495cda655a87fb4@linux.dev> <20261126161801.Horde.EPNAvNvUumt6-YVgeu2ZpuH@mail.your-server.de> <41ae89e5a8328124062eea53eab2fc49d6114a56@linux.dev> <20261126221229.Horde.Dolx0es1tv-1dHtbdt7kG6e@mail.your-server.de> <ABB4AE9E-9CB7-459D-AAED-481703358D3B@linux.dev> <20261127141540.Horde.j7w80xrIVq5DshPvlKMMIr2@mail.your-server.de> <B49A19B4-9C95-49DA-8AC1-A6F4122AFDEF@linux.dev> <20261127201403.Horde.ivCdJn-MZnrp2I8iyRVNzlp@mail.your-server.de>
Message-ID: <F3567849-C25B-4FB3-A4C5-0EBF95F9D047@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Martin,

Thanks for checking the captures.

On November 27, 2026 8:14:03 PM GMT+01:00, <martin@rfdeck.de> wrote:

> I'll keep an eye on it.

Sounds good to me. If it happens again, please try the monitor down/up test
while hostapd keeps running, so we can see whether the gaps follow the
monitor state.

Best regards,
Luka Gejak
