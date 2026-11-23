Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412173;
	b=cLSGjWoZliYLrtPIaqh7/4tAsX8DrSmIKWOmTBG0QNe1Y0HLZhjaLi0A4Rylv/w4wTwC
	 reeF3hy9Pgx+od3Gewn3KA9vugUmISt2pnCrY6ErDOkVcyNTfa9THCR/7VAYZTs2O4tCa
	 fH3q5B5cr52+cxb+lZ5vd6+9rkAkNsYqQ5vZZkFApD+RxGKu8JncGXaazmniMamIX7NWM
	 p0iUFo6PjvXJ0rWI2M99xU97+GMBPkzGaqJ8u8sS1y0vFYUQbJqgMFGM521CXgyhUWbVF
	 FU+hRwJrAz+QznYzAQDPxZuKFXFnGPszgnO2ygR0iRVaY+AAW6ALYh2zJKbkmZ+4TQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412173;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/ljjJjPx6p08/iSRJEuyBLof57p75u+LS3KNhjvmBy8=;
	b=obx8enXxHbFL2m4J2gMDW7U3ofO4eTpDKYPo3KLqpEpM4P5TNwh64a2kuhUpbNDOMaqp
	 lWomyWZidwtS3tIYxqXRU1w2SE10vLFB1jn7Cus2EEQk7fvsvHXciYAiIuEJEwBADNbKA
	 fjgd7EcKSfXrI/SYkoJ+qGfrPREmIYldtc3pOxYyLvcJ8Wb9WJglAG5jMsm4XilJqY/UP
	 aEijh1bNGDxrMauczIP9FXV+yzIYBgcqrPujNEI3BnxfwZUalZN+OM8yzU+StXnyeaN/V
	 kNKQTi8Gc2QUowzCiSXwyUSbbV2iAn5TOnJosoY8BTSs7qBCpwAy+/k8FxnDDtj9XjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=LhNKlcet;
	arc=none smtp.remote-ip=91.218.175.171
Received: from mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D95606A31E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 05:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D95606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=LhNKlcet
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/ljjJjPx6p08/iSRJEuyBLof57p75u+LS3KNhjvmBy8=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795412170; v=1; x=1796016970;
 b=LhNKlcetGFVE4SHd/XqauNTSmhm7VHjYJHcZG5qySiKj50lCb8irIsUrvQ3E+cgB8PjXA5QT
 4hTsiTRAdgPAifoeak0iB3etxTwa1tprjB3V0pHdNy6PU7lfj90vYj8Ni4nJJ6YrQQqgonSSpuU
 yKuL7xa0EQ8LceLQa/G/CP32/qk+j/YmpR/NmuIRd63Y636xqNIXdSG4t8kQa3AdCOR4m2mA1ma
 g2TyPkkw9mb9EJjFj8qNRF3oC6rynxvHFqmU13kioRO6Wl4V2plj0Pwv/cWqD7v2NH25votvjHO
 ek9fCNxMVKALQbjnyNSr6wCDtzeznLgKALsnW0KvAh+ag==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2696431195dd3d18;
	Mon, 23 Nov 2026 05:36:10 +0000
X-Mizu-Trace-ID: 2696431195dd3d18
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org,
	johannes@sipsolutions.net
Subject: Re: [PATCH wireless v2 2/4] wifi: mac80211: release monitor channels on suspend
Date: Sun, 22 Nov 2026 22:35:56 -0700
Message-ID: <20261123053556.81296-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261110185436.2015505-2-nbd@nbd.name>
References: <20261110185436.2015505-1-nbd@nbd.name> <20261110185436.2015505-2-nbd@nbd.name>
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

On Tue, 10 Nov 2026 19:54:34 +0100, Felix Fietkau wrote:
> A monitor with its own channel keeps its channel context across
> suspend, which triggers the warning in __ieee80211_suspend() about
> remaining channel contexts.

Tested with the rest of the series; details in my reply to 1/4.

Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca>
