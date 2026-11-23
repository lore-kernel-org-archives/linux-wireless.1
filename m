Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412157;
	b=DoQQaTljS8qFNeMxsWu63BVOTnGJCeiX6I5p8EMhbyK8rL/lA2SDqD4T85d+fe9hPosS
	 9SBEiCpuXpniycVZzQsJLgb7SRIgOiMVpuq971YecLpongq1wKOJajNIzXX/b7fUGORh3
	 HDZHOkmg61/BdNeu2Wa/jonAczQcdFXlXlHDb9dGkXjpHoerY8unwZskcjwQ0VwxPxKPq
	 vuunObQBMlfdckHDk2OMBROze8HlH41G7k+LWZBEndW0/jIdI9V/0/21ZZNSPC64hSThE
	 /zMj0f9VG/fHobEHzAfgFfy9qxihGXbg1Q2PvIO7b82xJlIuHhpypmPxOFnN0ZdWSbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412157;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QRKU8DavfERgzcf6PiYuXYTB4EIFzSz1oJP/7DdzoWA=;
	b=Hn/ehJvAF2/WFMFSBhQBSDSvczKSeWK2gRun7nU3tM8XkKr9fGsR3lveUvXej9p+Rl3U
	 nr4mrgnPg1QWNcRCCLcEpgtbmfvo9EwDhHey/TQmWH1Q9V4LArQVLGT2Fp3LVR+F3P2xk
	 zf+VphdKVavk5PuPAkq+0qXea+isjGTfpfCtIc+QBEDBcjM+EaVrIzIVBDhqLuehB/kcy
	 aqio9rdiSvklBw5gwTaKomGLY0CesqTSQ73S4Jh9SazHAISnjEvXMIpWrZhCNPZtafkfY
	 HbPKdXzWdMRcNMkFdXaR9nA58zLmH6EuccmbrErtWaMjIz2jjUgCGOxq93YQz53EBLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=R+LBHZkS;
	arc=none smtp.remote-ip=95.215.58.117
Received: from mta1.migadu.com (out-117.mta1.migadu.com [95.215.58.117])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73290606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 05:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73290606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=R+LBHZkS
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cAq2Wmf0W2/LzaAmWpA//nA/vI0NprEBWCd127ZAzAE=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795412154; v=1; x=1796016954;
 b=R+LBHZkSRkxw3Wh4RlwlKu0nb+wdmGHtoqX+EJtnlAnqPhn9mAK8dj92tXQS992iM7bVuVXG
 bGQzMGXQYRXQJqfQISzYQJ7j+e4zV/fg5uB7nCB1zOjfUer3X6iiSg+sf8hZBLDRn5gWEGfkwLI
 +EHqrQr3S1PDFzywL2dwvBKg6EW0JIQTYtSOVF3onuZGM3QS8qQeohDM9puqdwX+ZIAxfX3mzP2
 dfnztvTKZx1f6JZs4jA2wb1W6M3aNo0O0urIuDpvMmHVNa4kiwx0e7abQTqGQ+yW19Cro4dyYy/
 2RQCRu4q/1++ELR5tqM+qtVJg881zpJtvH3KWVySouVxw==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 335b2b496343e8e6;
	Mon, 23 Nov 2026 05:35:54 +0000
X-Mizu-Trace-ID: 335b2b496343e8e6
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org,
	johannes@sipsolutions.net
Subject: Re: [PATCH wireless v2 1/4] wifi: mac80211: keep the monitor chanreq empty without a channel
Date: Sun, 22 Nov 2026 22:35:43 -0700
Message-ID: <20261123053543.81266-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261110185436.2015505-1-nbd@nbd.name>
References: <20261110185436.2015505-1-nbd@nbd.name>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 10 Nov 2026 19:54:33 +0100, Felix Fietkau wrote:
> ieee80211_do_stop() releases the channel of a monitor, but leaves its
> chanreq filled. When the monitor comes back up it has no channel, yet
> the RX path still filters on the old chanreq and drops all frames
> received on other frequencies.

I tested all four on two machines:

  mini PC   your mt76 tree at afe54fd58a87, MT7922 and MT7925,
            monitors passed to the driver by the mt792x active
            monitor series (v2 coming)
  laptop    Framework 13, 7.3.5, MT7927 (stock already passes its
            monitors to the driver), MT7925 as a control

                                          without           with
  monitor on another channel, taken       0 beacons from    87 to 88
    down and up; a second monitor on      the AP in 10 s
    the AP's channel
  channel set on a monitor that is down   -EIO, warning     -ENETDOWN
  channel set on the phy, a monitor up    oops              -EOPNOTSUPP
  s2idle with monitors up                 warning, added    clean, all
                                          again on resume   hear again
  five s2idle cycles                      the add fails     0 failures
                                          with -ENOSPC on
                                          the fourth

The stock s2idle rows and the oops come from the mini PC alone; I kept
the laptop out of those. The five cycles and the oops ran on the MT7922.
The laptop's MT7925, which still uses the virtual monitor, read the
same with and without.

Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca>
