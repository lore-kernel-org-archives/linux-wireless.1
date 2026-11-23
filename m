Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412201;
	b=Lw0fEdJtjvvElaaNBexj4bPzjoGCbE7J3oOJHHbw3iP86SxbXOBzxSTFAQXtU+FWJrY0
	 J23kmq95BGxyOhv4F/FKwoOTYILpRXQ4dQ0TemsyXELGRkIbiAEcsjy/lFCFKy1mjYx3x
	 pWr4MZGFcGREaPHKuXZv4oge0bmUZGv5INgQQLolpoT7mK8o60BzWyDa6zQT0uxJGkncQ
	 q5Ts/Q6Ga74A5OHT9cnsR90SOx4CPUqpCxfHzJ0xAUXTNjsyAG3G5cSyci8eAknEhD6yy
	 iupGNSmI7L/u6xNopWfjaRav5dApLMu8otMZGH+Xlzusupf2tFu+zVLSnBehF88iSfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412201;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+8eJgF8shchY/vOJBw7OoT67Po4piXNYcStb/+L6uZs=;
	b=2UqhMiwKjhNNbhESXXGDyN0iTP6xmZodTkuJ53IqXro6sSTUEeSCX71pc7L6RTRRzcVF
	 kPrsO5/xYxcN1EtvNaRB8+7qk9K0SSZmFPERhxcCywaSzHhKs8H+Zof/MzujWv1wLuzML
	 xzVOqkIgtpwEIr4EEjY9awKe9uDWuoBZ5YH4l3FqYUYIy1Sn9mdNRXSHcic/UomTaXSz9
	 Vrrc8w5JtMktt1M8Lo4iU1OHzMjJlO4+G97XxhF8nlrEahTyZ0kUoyzX039F/HP8hV3mx
	 9QoRBad/OKsbG2gpz/85O587bEXlGp6PjnZTv1fiPE7r8zlZh0O1S2tW1Az3Aw9sVEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=Y8iuU6FY;
	arc=none smtp.remote-ip=91.218.175.177
Received: from mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D3D606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 05:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17D3D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=Y8iuU6FY
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+8eJgF8shchY/vOJBw7OoT67Po4piXNYcStb/+L6uZs=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795412199; v=1; x=1796016999;
 b=Y8iuU6FY+r9p6cwUSdiLa2QyCsJVxKOdDlM6jSZ6oyLnkdNLryEfsEnM4TR1sHKNO/RuRb6F
 l4GUTD4+mSNCEP/jx93FdnBd77c59GdEDVGWRaAZQKm+p/qYhnQRWH3eCoc1QMCXuWUkyL0BerI
 QGaKcX9mHiQz36XQo4wspE3WFlTyLWnrhG/YdEXjjNO7rYtOswaBO+Aum8Q4kNJw3gGoj4+CO6t
 qkwYt5fN+r/JlwHG34QjMe6x8yq4l68pALZnxk/E1bpeCR4JhZe6olbf+pc9Myzj5/l8m/2Ebl/
 j9rmC7BFNytq8IoNhFzO7GrgGTRArcGQ27AdccImS/jrw==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 02e9fc5967f99f13;
	Mon, 23 Nov 2026 05:36:38 +0000
X-Mizu-Trace-ID: 02e9fc5967f99f13
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org,
	johannes@sipsolutions.net
Subject: Re: [PATCH wireless v2 4/4] wifi: mac80211: reject a monitor channel without a running interface
Date: Sun, 22 Nov 2026 22:36:25 -0700
Message-ID: <20261123053625.81349-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261110185436.2015505-4-nbd@nbd.name>
References: <20261110185436.2015505-1-nbd@nbd.name> <20261110185436.2015505-4-nbd@nbd.name>
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

On Tue, 10 Nov 2026 19:54:36 +0100, Felix Fietkau wrote:
> With NO_VIRTUAL_MONITOR, ieee80211_set_monitor_channel() applies the
> channel to the interface of the request. While a monitor is running,
> nl80211_set_wiphy() can send a request without an interface, and sdata
> is then invalid. A request for another monitor that is down triggers
> the warning in check_sdata_in_driver().

Tested with the rest of the series; details in my reply to 1/4.

Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca>
