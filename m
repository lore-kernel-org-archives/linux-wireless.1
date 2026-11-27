Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788451;
	b=jptJ6yRxePtc7BnohQ1TjXY4ngdKF0n7SLjPIIPUIA/e01R6O66cqc4+LRsnIu4dQI6i
	 i94/E68XoScqtHtwuKCRtR7KGINUBGGiyo3qvI6MIKmgM6FDhP9aWgzwuRPCe49o7Ojgk
	 Xlq8zq9UhGajcoW0hQo8vRcrqD3BAz9KH37O1K7E3Rkg2JQUvx2SSMjDD9KMhd99FTN4k
	 BfmZlkieaT4O87NltJzDil8jXni4w7erWA/YgwfiJXOgfrOTVpEOCS5CZFGx2OIgWyY2O
	 s0W8hTJebDxJtKAl/AAKOv9qfamOduaIt5Ijai+ATxnHGHveIXrnaSqZbpFiNIM85Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788451;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=BwakWbv3CQoSB57i9e20R7Q+MDjc6nBeyQbmEh+h4bk=;
	b=ODRVeNpwIkn6ReFFOU4WHXjkhpvp9xjLD2tRKjPLBk2zfjf5e9vpBe9TdUEOOM1dZWSQ
	 gBDAsvgNrH41k4HEU+E0i+AOkNcZAm3HnVxthbmm/S5zh5orysj1nM5nEpA6CivzsIHt1
	 KfhPNtSAVI6GgB/7lp065ShhJnvH9Fi/1XpLJ4Dpz5RJlXQtcTX82LaPFL+s8ozlHZ8Lx
	 NMbM2bXT45YI3HKKfZFPPIob9aEN0FhO1rJkHV6lFf7+lXGL5rIMo4w9WjXAuYtDQVrFt
	 2kCYeDkhzEeIOAIU2Gra0INLm83TJCIu6BJtn4/EpifZRCIMcCd/u84n/U+I7XBNFhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uJXcORnI;
	arc=none smtp.remote-ip=91.218.175.63
Received: from mta0.migadu.com (unknown [91.218.175.63])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E6D606A339
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 14:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09E6D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uJXcORnI
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BwakWbv3CQoSB57i9e20R7Q+MDjc6nBeyQbmEh+h4bk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795788447; v=1; x=1796393247;
 b=uJXcORnIJP/jwbDqCF8Arlzu29l8oRMb7/t8hKngaUfP85jTndkYvWL52m9ck9daIuSTN2yx
 oQnfVXbmSnBWPEID1xF+JOg/hKUbtxSugvhbPMCLbo6eZ+D59gvDHwFNqv5lsVOJLLd5RVe2rLC
 gEffmPpdOeQ4pAyZc0QC/S/g=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b772f44a79624439;
	Fri, 27 Nov 2026 14:07:27 +0000
X-Mizu-Trace-ID: b772f44a79624439
X-Migadu-Flow: FLOW_OUT
Date: Fri, 27 Nov 2026 15:07:23 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: martin@rfdeck.de
CC: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>
Subject: =?US-ASCII?Q?Re=3A_wifi=3A_rtw88=3A_usb=3A_AP_sends_no_beaco?=
 =?US-ASCII?Q?ns_after_monitor_capture_on_the_same_phy?=
In-Reply-To: <20261127141540.Horde.j7w80xrIVq5DshPvlKMMIr2@mail.your-server.de>
References: <20261124144427.Horde.qQ_UTCx-6LmjjeS1bojTj8-@mail.your-server.de> <D34D5E6B-B159-4F34-92D8-4264024D3319@linux.dev> <20261126081256.Horde.ilxldEFeRo6UQJajd_7Nd6S@mail.your-server.de> <a0827be820914280cca81b32b495cda655a87fb4@linux.dev> <20261126161801.Horde.EPNAvNvUumt6-YVgeu2ZpuH@mail.your-server.de> <41ae89e5a8328124062eea53eab2fc49d6114a56@linux.dev> <20261126221229.Horde.Dolx0es1tv-1dHtbdt7kG6e@mail.your-server.de> <ABB4AE9E-9CB7-459D-AAED-481703358D3B@linux.dev> <20261127141540.Horde.j7w80xrIVq5DshPvlKMMIr2@mail.your-server.de>
Message-ID: <B49A19B4-9C95-49DA-8AC1-A6F4122AFDEF@linux.dev>
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

On November 27, 2026 2:15:40 PM GMT+01:00, martin@rfdeck.de wrote:
>Hi Luka,
>
>> When the low beacon count happens again with the patch, could you keep
>> the same hostapd instance running and bring only the monitor down, then
>> up again?
>
>I tried, but it didn't happen again: 15 more runs of the same fixed
>channel test with the patched rtw88_core (monitor up on channel 6, AP1
>and AP2 for 12 s each, no update_beacon), and all 30 APs sent 113 to
>117 beacons, so the monitor down/up step never came up. 0x422 was 0x71
>before every AP1, 0x31 before every AP2 and 0x71 during every AP.
>

Perhaps the environment is influencing it as well?

>So the low count is now 2 of 25 runs with the monitor up, both on the
>day before, none today. If it turns up again I'll do the down/up
>measurement on the running AP as you described.
>

Ok, keep me updated.

Best regards,
Luka Gejak
