Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204389;
	b=rSMEkWqgJtIXHoa1/tnneBdIaDyIm+OOHDezFlsvrkPRlhrMVN2UHyrsFs2AqBdlMAYK
	 e3WDtMFdOYkseu1HLSSThFAdbtZyLHC69j4GvUi2j/H1XRESz4qmKQmlnO9X15xH+RUjj
	 vsZ30D3YIzRrExfQR7fMsMxcUSDgQxkiKUAUFjfSg27DV5/uHgS0YsGn0sh9z7A+eMqXd
	 fwKZtW1gUXFasZloC0VZCGFWBFvwT93983X7zZcTMSP4ahf/hxhNgEUPm6UYR+2gcamv0
	 UFl1U8OdGFK05SAMHxr8gSLQzrc9RWBrraE9kXX5Vs5xPCiw67zChdJEIM2NHran4hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204389;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hcdTMZoXeiRJKT45jUV8mNgGL3119qsxOEzWv8susWI=;
	b=yd0Li9GfcKflZIlGIdpwY7IOx31vZ2wOnB+uH0+YAcuPPBX8PvMc6XX9RMD59nrIjf2N
	 EtajUUmGmL22aUm0SjRx46iNQtcgxFUaeJDr9g/f/bng8j1BU60Ydo/iKKXj0lx1wHw0p
	 wM4sZlBl6pOn1WRdTlbrsusUQ6w0FacnwZ4ye6TXA3KpWy2/b5CvmoF/KxegTfilawza7
	 NeFSxDmM4gaIijhoCYVlH+3eoLzs3l9yK/CzXHbujseogMVnqHftOg2eTIvaHeCwDBTwe
	 rfh4gZbhOQ6LUrxaZapKGmyHxb8UTDIb/P4FEFRYZbEreH85LhOdjYlSX3PPppX/79w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=If23l+1m;
	arc=none smtp.remote-ip=91.218.175.57
Received: from mta0.migadu.com (out-57.mta0.migadu.com [91.218.175.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C42606A321
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 06:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29C42606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=If23l+1m
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Le4px4ZDaI9F/nnKz55Hgo9tS/EPLYlM5Dfo738Z/aw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794204387; v=1; x=1794809187;
 b=If23l+1mwnb4EatYrVox0Wr6JZLXmqczpISyf9mYMSOpI3BjJ6hAksjvS05ud2lX6MaleSaQ
 bnOAaFfvaemSR5dYfXRlIOFfkPl0oTWeXuba1h66c8MGfa9udAcCZeA05WSl34zqZZ6USXjGwJF
 uWt/LWi8v7ib1UNNKnQ2QjI8=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f7fe618b77f343ee;
	Mon, 09 Nov 2026 06:06:27 +0000
X-Mizu-Trace-ID: f7fe618b77f343ee
X-Migadu-Flow: FLOW_OUT
Date: Mon, 09 Nov 2026 07:06:23 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>,
 Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
CC: Kalle Valo <kvalo@kernel.org>
Subject: =?US-ASCII?Q?RE=3A_=5BPATCH_rtw-next_v2_0/2=5D_wifi=3A_rtw88=3A_?=
 =?US-ASCII?Q?8822c=3A_check_register_values_in_cck=5Fpd=5Fset?=
In-Reply-To: <b91cf87116d04aa7b3d1758ff58fab1f@realtek.com>
References: <20261107183403.50696-1-zeshanahmednobin@gmail.com> <cec3629205b2535d73f5285caddec290e7bda1c4@linux.dev> <4f3b37d5e7bdc710a54e46b4f28879b4f51ff15e@linux.dev> <b91cf87116d04aa7b3d1758ff58fab1f@realtek.com>
Message-ID: <32B31B48-2A08-4A09-8D19-39FF49FE7306@linux.dev>
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

On November 9, 2026 3:10:10 AM GMT+01:00, Ping-Ke Shih <pkshih@realtek.com>
wrote:
>
>
>Luka Gejak <luka.gejak@linux.dev> wrote:
>> November 8, 2026 at 8:32 AM, "Luka Gejak" <luka.gejak@linux.dev> wrote:
>> 
>> Typo:
>> > Do you mind resending this series and putting
>linux-kernel.vger.kernel.org
>> > in the CC as well.
>> 
>> linux-kernel@vger.kernel.org
>
>Why is it required for wireless patches?
>
>
Wireless list is bugged out and nothing newer than 2026-11-06 15:46
UTC is appearing on it.
Best regards,
Luka Gejak
