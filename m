Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795723003;
	b=gulDVjvSFpugrPf8HR4nmbPoiPxsgGLkXoMQUQVpWnTFZhrrfW4rJApP+rk+tnfNmtW+
	 cGqErj7lVsB5QkwwhGfx7Ci/63aHgkWqvhvSx3okBJuCVWpbkIUgVLYxgqo6nc66Ja5mT
	 I1zA9kezEUquJEYi/nvigNQ6Fy8HisTdyeABlIK4tn8g2hU0Z2nVC4zvC7Z7IGSSgxMzy
	 C05Q6i2c3daSEiihpfDVJoFESSrPKJVck0tOy/Rc8EukhrFNztjihaO4Krfd3eIXRMYr5
	 BWZXJiPQxac7bLmSLqhYE5//yMBJBhePf1uNghNUmxcgpjlfhs7vm6VT8cu5dOCmayQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795723003;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hy9l76kJSdlGPxuskTIu/Sf3zHIbanodiZ2WuGUccuQ=;
	b=SjH4Kc5HyrGTrcbMK2JRVy2NGSYdYWj6AD4qSxGQWijKK5HfN+5fHsvgIc8lfrOWzTuP
	 Qs81NUYKsgBA220tNk1vf/FNCIZHS4EmtXO6RmGnuFGqdzk2VhTjsKyC/2OpRZdH3I10Z
	 wCfmKhnQK2xpU1nl2g3U/5l6qHyj/9p5Iq3gYZ8QRHVMNHAnAPWGIRjYFhEiau3GUiB7K
	 RjkzYhPrlNpgXaFzIe1jReYDWEnqYNoIm36G9aYijzQsXmBLA/gs/c9z3mLhz9xBoPL8a
	 uMI30lQKMbKbWhHeDbMvtJuuYrXjT4dlTO2EZP36koZB5OSTmG3CFK0aQeD0nXy0Jxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=klb3IJ5R;
	arc=none smtp.remote-ip=95.215.58.196
Received: from mta1.migadu.com (out-196.mta1.migadu.com [95.215.58.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B16C606A323
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 19:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B16C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=klb3IJ5R
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hy9l76kJSdlGPxuskTIu/Sf3zHIbanodiZ2WuGUccuQ=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795723000; v=1; x=1796327800;
 b=klb3IJ5Rf2HTMMeUaxauBqfXsZyuMR6Dz00SWAhO+oGUkpEt1wXeyKEkQu/rln+wlmhXfrjf
 kWuOtLSMihY5Zl8gp/Z5FyM/WaiJXJxX0XLKAeJdnO/iKIezzQtRChxomnAjpnJF2UkTplsTAYA
 J0qaU3WFUpX16hVNKVYA2MtDxfMm6q0cReMuoS21TJwmuMoiIYUiJN/WO3z91XIHwM6FFBViKn/
 id244JelvvPTE/57oU9+q0+4yJ3EFsvJ5wXwQV+1yNt2sB10oIvqO4H9aDsrpsItYe4EeeHdAAP
 12tn5rxYboYkyAO+Ahsb+hs395C57L45WK8nnWKQRnm4w==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f9e9ceb29dc6adb0;
	Thu, 26 Nov 2026 19:56:39 +0000
X-Mizu-Trace-ID: f9e9ceb29dc6adb0
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Sean Wang <sean.wang@mediatek.com>,
	Javier Tia <floss@jetm.me>,
	Marcin FM <marcin@lgic.pl>,
	=?UTF-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH wireless] wifi: mt76: mt7925: fix MT7927 receive loss after a channel switch
Date: Thu, 26 Nov 2026 12:56:28 -0700
Message-ID: <20261126195628.18471-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261013023810.256061-1-lucid_duck@justthetip.ca>
References: <20261013023810.256061-1-lucid_duck@justthetip.ca>
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

On Mon, 12 Oct 2026 19:38:10 -0700, Devin Wittmayer wrote:
> When the access point announces a channel switch, an MT7927 stays
> connected but stops receiving until it reconnects.

Gentle ping. This still applies cleanly to wireless and to mt76-fixes.
Is there anything you'd like changed?

Devin
