Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.241
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795293208;
	b=moVuyQXkV0TbjNYf59NHg7YUfCookCN6K6yexhzTv3lJBWjUiPJcOx2OuNUsdm8qZ99Y
	 fU8UUGj77cm21CCblf6qpznDiEzu6EnXxfTZYfxgE4u8bQ9A7ZQDGHOv7BFUeVUiECP0O
	 PjU7GRl/ah3vAn0ITzyaYlP6sxZ9TUHZ+iTjF1elRUA9tD+gNoj+paqCuBtcXO7U/XOkt
	 7SRyP9euHRAkPVy1LTibEn4CI2UjB7AnQ1QOOdcFv3zXaCHb02papC6a5r/UdBFYaqXhB
	 Jyl7XwReo/UyotGVdgmLsuYyQuNQHSrZwOMwTM8z8TjHe9kL9iKFH0jzm6AaqJz0vqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795293208;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GfcLwl9nMD3abzI9ow/CG21oWQfTAnmOPJtYxXca7Rw=;
	b=mQyCV/aCiztsMQBphgjpnY2AeBjMtKapK41tXEeS3xPHHWhHPx0SkmdPNvCHRs4p4dtU
	 htPqafVwNqFjTV+kmJQdEXOIOhE3jCfZtPwyrzfJxBYSQXmaeXbw0lnkxKdG+/cypuJ9i
	 AKkkZc7Z1aJpwZxjPV9ZOTLb4OZzAxtOOyIHG8hj+jNLJ4anh/CpjDqDOOaDBkXdz5jpG
	 rBkBKRo4L3XQSasAAfBPlKkE+9YnUqwm329Qw5dwkvUgkHRboxxZS0XFLYNBsgiSLjQzs
	 UonbuVGF87112a2VEpDyyQtPGEJ66VHnDOTWh4MIx2Fkn4Hfo33iZNZvuWKcs9LgX4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b="do6kPe9/";
	arc=none smtp.remote-ip=95.215.58.241
Received: from mta1.migadu.com (out-241.mta1.migadu.com [95.215.58.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93210606A320
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 20:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93210606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=do6kPe9/
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1+y3BvArKssnZYEujMUPhUqX1+rxcd5R0sMwYG3j6uo=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795293205; v=1; x=1795898005;
 b=do6kPe9/Bn6UTVidyQIaIpZc8AtauxqWEkzl/J+gM+Hdwff4qbBAY8ujFqemQ8bD1i9l0hoS
 nuhK+a3gQseJMvjXfmQpMqk7qLzYY16vF92f3XmfT6Sx8YxDLugswU602c+XoCpPdcuneslbY6F
 sfR/yaiipha7+4TbE55ebXertKF8VwO/tu6XdLbdzOTXpAAgb89a3u8gXwOuX2kUp76NFp43vPT
 DM4cKw56wcIMnKpylYtoVhMiL1OY8IRy9rNcMctrHT1U2RDQiQm3buNblZnzsUxFX+kF0NqEqHq
 L10fI3WtLFkWJ9oOXLqVVWnECTIj1aiPSQ7SMwhikD48A==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 743bb9bf1fbf2c97;
	Sat, 21 Nov 2026 20:33:25 +0000
X-Mizu-Trace-ID: 743bb9bf1fbf2c97
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH wireless] wifi: mt76: mt7921: let monitors see other stations' unicast
Date: Sat, 21 Nov 2026 13:33:17 -0700
Message-ID: <20261121203317.13422-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <c983f41c-ee0e-43e3-b578-cab9738d8da6@nbd.name>
References: <20261026220346.601314-1-lucid_duck@justthetip.ca> <c983f41c-ee0e-43e3-b578-cab9738d8da6@nbd.name>
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

On Fri, 20 Nov 2026 17:27:43 +0100, Felix Fietkau wrote:
> On 26.10.26 23:03, Devin Wittmayer wrote:
>> Clear that filter whenever the sniffer is enabled.
> Does the filter get set again when monitor mode is disabled?

Yes, though not always right away.

If a station stays connected, the filter is set again when the monitor
is deleted. If the monitor was the only interface, the radio stops with
the filter still clear, and it's set again once the radio next scans
or connects.

I read the register after each step of the runs behind the table in the
patch. Same on the MT7921AU and the MT7922 in every round:

    after deleting the monitor     filter
    with a station connected       set
    with no other interface up     clear
      then a scan                  set
      then a connect               set

Devin
