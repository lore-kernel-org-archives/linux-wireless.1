Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817324;
	b=2euwk1uDhpwGb2IXgytPkHCOn5I++B4jYrSOF7aiyVWzWXmDaFZIhI+d7iaeocxiktCD
	 s2Khl9OlYCvFsv/VuxKfNIod7ks3C+nY4vUegmji1YGzZHchTide5IiXr+su1X0jzInZ+
	 lrsoUCI+p3J1eudrszs6pgw1SnaOtG574HSgacup0Gew9jfiLBfp5nil2vkyv7W5pusg4
	 +4UumRRDDYza9HPVwN/P/dhrUp3Vp9KHR32xSHSPu211gfW29F/FwAQ/lRSa29sbo99oL
	 6R7yYF7AYGuIdh2/fetT7HlkRrjEPhgA+B0/oCzsv/FfF9ipe8/8EwZoeH/GPRXyO2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817324;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=77LzJsdVsNip6MkS8i8hGAoB/pLEvqzKmKYq6uHg8Jk=;
	b=UsQq/jPKHHxZ9YTP6gyfPY7PCKMlBnmA3VGaDvjcXIYdmaQW40DhzLjBF1e1UHL7o36I
	 MufKBb1phuC1qA2LLVqU9Km0X4rsHLjbb5sdeP/IMt47Z1VFONVbWL3SZnCdnt4FJVLF6
	 dfKqp14g4qovMtrlW7k7uhWx6i5NqNWOcTKCAH5ErPpA3sY486Czw1N0Uk3DAm9zICl4E
	 ns977oDBSWzJyvR4fVnTmqXymTAPBGFyEK5GDAGTxG/K5ITZjggoBV5oEPtP2LEwCiiLQ
	 6SUUhTWHMPP0oRHB/EMiV9tEy71fJG36txf3wfcZM/7cLdn+8OEDLRNMq5BUsoNrXmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KTfGac7e;
	arc=none smtp.remote-ip=95.215.58.139
Received: from mta1.migadu.com (out-139.mta1.migadu.com [95.215.58.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B99B606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 08:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B99B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KTfGac7e
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=77LzJsdVsNip6MkS8i8hGAoB/pLEvqzKmKYq6uHg8Jk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794817321; v=1; x=1795422121;
 b=KTfGac7eBtXHx8eqAe1+RnihrQjb5MO6vN6Qs0tdnl7O65SOmKUlSIz7bxKCgO5HKmaK2Zfj
 mMdpG460oZfUKrtpAXKGIRhwSB+ipvE3LGsK1YYHVKnJJW7Xvu1leSM75xU3VcjiTn42De7t66/
 ClvnRzYPkoz0Mm75LYhDoPlU=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0d77f15ee914f6d3;
	Mon, 16 Nov 2026 08:22:01 +0000
X-Mizu-Trace-ID: 0d77f15ee914f6d3
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 09:21:58 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
 Yan-Hsuan Chuang <yhchuang@realtek.com>, Kalle Valo <kvalo@kernel.org>,
 Stanislaw Gruszka <sgruszka@redhat.com>,
 Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next] wifi: rtw88: program the beacon interval
In-Reply-To: <20261116072022.1142783-1-mehmet.fide@gmail.com>
References: <20261116072022.1142783-1-mehmet.fide@gmail.com>
Message-ID: <F67843D5-7D0A-4A7D-BAB7-DC3DDA1DBF6D@linux.dev>
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

On November 16, 2026 8:20:21 AM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:
>From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
>The driver never writes the beacon interval register, so the hardware
>keeps its default of 100 TU. An AP started with another interval says
>that interval in its beacons and sends them 100 TU apart.
>
>With beacon_int=200 in hostapd the beacons of an RTL8822CE, RTL8822CU,
>RTL8822BU and RTL8821CU are 102.4 ms apart on the air.
>
>Write the interval when mac80211 sets it. The beaconing interface is
>always on port 0: rtw_core_port_switch() moves an AP there.
>
>Reported-by: Luka Gejak <luka.gejak@linux.dev>
>Closes: https://lore.kernel.org/linux-wireless/1D396970-35B7-4B0B-82E9-24B523AD69C2@linux.dev/
>Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
>Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
>---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
