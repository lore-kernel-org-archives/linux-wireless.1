Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.130.186.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999265;
	b=xJhz8TPtaKdLEhn9J7auShBIufqUKu13U0KobQOpF6tIiDE597RJKxdHkgEHGl3gOy80
	 Wj+PwxCceC7n9YHbr0BAn0hIHiRONHwV7T1UfAgg+Bp0cI7gob0/Z+uwgfXo32S9JZFJA
	 R83+cLHXVZipursLlGN+ln91DtlrBo3d4syrvhkB5w+Uanlc+Xr7POYcITP6H7b71DtWG
	 VFL9bKWhzvGBfeGtVotW9FuQd1PjESOlZHJeusowUXkGC3R5ucIAnoc5b4wnHi4SfwzDC
	 OkBTWJQju5l5E8h7DfEQx+7LrFOvlSPL/GYaBMFtUwR4SjulqBisai8JXe1FTdpRnQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999265;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=QiyXyxSrpIPdaIYUZ2ZqMEmklUEYSfa+mvgQR6lbI78=;
	b=X28LPUCUO2s0HS78A87MbuqGQ15qRuQ6tooEWryouKa7h5H93RxQ/E1QouhgGtfLxweQ
	 NE7dIDqCXvl9wMvIQjcf6cBFaL0XFMMXga47wFgCxIz/Q0riwv9pS45D8U10bqEN4IxFT
	 g2n/UIMWgvRrtETroT6jXPWz+Dc6Em8MaLGUCQZ01H5pjt0InkAOAsnEUkEnS38dzwth2
	 /e2h7xz4RYE6GQl/eitYVMuHKLU2tt+UE0jthO7EVkz5bxXYzjqYOcgoKZygwbGcpDNzg
	 OOXdcLbUFvxsg+Qh0vQDh3i/CBUHn61jBKPG637Md5Y2oRWPRdnRIjSUQsnJ3m4v2ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hardeman.nu;
	spf=pass smtp.mailfrom=hardeman.nu;
	arc=none smtp.remote-ip=94.130.186.121
Received: from thor.hardeman.nu (thor.hardeman.nu [94.130.186.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D7F606A31C;
	Wed, 18 Nov 2026 10:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9D7F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hardeman.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hardeman.nu
Received: from thor.hardeman.nu (thor.hardeman.nu [IPv6:fd27:2a41:8fcb:2::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "thor.hardeman.nu", Issuer "Hardeman Internal Mail Relay CA" (verified OK))
	(Authenticated sender: nullmailer@odin.hardeman.nu)
	by thor.hardeman.nu (Postfix) with ESMTPSA id 4jTz4P1jRMzFpbP;
	Wed, 18 Nov 2026 11:54:13 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=hardeman.nu;
	s=202608-ed25519; t=1794999253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QiyXyxSrpIPdaIYUZ2ZqMEmklUEYSfa+mvgQR6lbI78=;
	b=g4fOa7IjwZPVb/OPT3WSpvig/YvdLfosUd2E1JaMdWxJfGpKP1C70n3Mrhrp8JrL3VM5PJ
	fPob5ULiUjFtShCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hardeman.nu; s=202608-rsa;
	t=1794999253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QiyXyxSrpIPdaIYUZ2ZqMEmklUEYSfa+mvgQR6lbI78=;
	b=UpU9e86m1FP1M1gSA+Sox/q6nelj5nTl3SiUCdk7d84RFjV+XWZgjJ6ipNG8oxMGdV4G6C
	M1ck+Nd2a8jHNLOsLtedhybOHLFifLbIjbBQTm5/RuBf1JXYOicx2ivKf4b731Tz4CVZUr
	9IQjde52QsDMbnqUouKxIz8MpF2QkyGuKS5W90QVAnX/AywEyfOX/xgLFUtrgJR/FcMcUn
	rGL6WYidyyAGbxetPOuM/8oiomGYlDc1HMn8+UEne8wl6mvWvr8hZZqzzCGjAGNLC4tN9u
	lSpo2hCKVTLMVlKyPzunfhL5tUcThz0OSItmnX8YNr3VRAPIYtEf/5oQ2B+24g==
Received: from odin.hardeman.nu ([fd27:2a41:8fcb:2::a])
	by thor.hardeman.nu with ESMTPSA
	id yZi9AdWD/WrYOikAWTs42w
	(envelope-from <david@odin.hardeman.nu>); Wed, 18 Nov 2026 11:54:13 +0100
Received: (nullmailer pid 548010 invoked by uid 2002000001);
	Wed, 18 Nov 2026 10:54:12 -0000
Date: Wed, 18 Nov 2026 11:54:12 +0100
From: David =?iso-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leonard Lausen <leonard@lausen.nl>, Alastair D'Silva <alastair@d-silva.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: Re: [PATCH rtw-next 0/5] wifi: rtw88: sdio: faster and fairer TX for
 the 88xx chips
Message-ID: <av2D1PomsLbjVaWo@hardeman.nu>
Mail-Followup-To: Luka Gejak <luka.gejak@linux.dev>,
	Ping-Ke Shih <pkshih@realtek.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Leonard Lausen <leonard@lausen.nl>,
	Alastair D'Silva <alastair@d-silva.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>
References: <20261116190145.2736364-1-david@hardeman.nu>
 <4c0d81f7a207468d8bca3c3c1a5b8dc5@realtek.com>
 <avxoWTaI2G8aklLk@hardeman.nu>
 <03BBDDF6-2ACB-4B06-827D-69811DF5664A@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03BBDDF6-2ACB-4B06-827D-69811DF5664A@linux.dev>

On Tue, Nov 17, 2026 at 04:27:28PM +0100, Luka Gejak wrote:
>I think the closer capture would still help, with the data frames and BA
>bitmap for the same TID around a scan. The client trace shows what its
>firmware passed up, and the per MACID failure count does not identify
>which MPDU failed. Matching those to the air capture would help check
>what happened to the particular hole.

(Full disclosure: mostly LLM-generated content here, I tried to edit it
down to a reasonable length, but I'm not 100% sure which parts to keep
and not, sorry about the wall of text).

Thanks, the capture helped a lot. Short version: when a client is
off-channel for longer than the chip's retry chain lasts, the chip
discards the MPDU, nobody learns about it (rtw88 reports SDIO frames
as acked), no BAR is sent, and the client's BA window stays at the
hole. How long the chain lasts depends on the BE contention window:
with hostapd's default for the AP's own BE queue (CWmax 63), the 32
retries are over after about 85 ms, shorter than a scan dwell here
(110-150 ms). With CWmax 1023, which is what rtw8822c.c initialises
before mac80211 configures the queues and what Realtek's vendor
driver keeps using, the retries outlast the dwell and the holes
mostly go away. Details below.

Setup: an MT7915 (mt76) sniffer 1 m from the AP, an iwlwifi client 2 m
away, a TCP download through the AP, a client scan forced every 20 s,
60 s per run. The sniffer passes up only part of the A-MPDU subframes,
but practically all BlockAcks. On the client I logged the frames
iwlwifi drops at its PN check (a kprobe), which gives the hole's SN
for each loss burst; clocks were synced to within a few ms.

1. What happens to a hole. Example, SN 2971 (TID 0, seconds into the
   run):

     22.0063  last BA before the scan: everything up to 2970 acked
     22.0065  client sends a QoS Null with PM=1 and leaves the channel
     22.0092  A-MPDU starting with SN 2971, no BA
              ... 2971 at the head of the A-MPDU 31 more times, about
              2.5 ms apart (rate falling to 6 Mbit/s), never a BA
     22.0926  last transmission of 2971; it is never sent again
     22.1205  client back (PM=0), 28 ms too late
     22.1607  first BA: SSN 2939, 2971 missing, 2972..3002 received
     22.1652  the AP sends SN 3035 (= 2971 + 64)
     22.1853  BA SSN 2990: the client's window has moved past 2971
     22.196   iwlwifi drops 63 frames (the bug I sent fixes for)

   This is the common case: in two runs where I matched every loss
   burst to the capture (18 holes, stock driver), 14 looked like this
   (1 + 32 transmissions during the dwell), 2 weren't in the capture,
   and no run had a single BAR.

2. It isn't the series and it isn't the client. The stock rtw-next
   driver shows the same pattern (the series has about half as many
   holes: 3.5 vs. 6.7 per run over 11 runs each). With an mt7915 client
   instead of iwlwifi, the AP's firmware TX statistics count failed
   MPDUs only during forced scans (9 in 9 scans, 0 without).

3. The retry chain is too short for the dwell. With REG_RETRY_LIMIT at
   48/48 the hole's retries last about 112 ms and end a few ms before
   the client returns; at 60/60, chains of 36-48 transmissions (up to
   about 125 ms) were acked after the client came back and the holes
   went from 4.3 to 2.6 per run. (63/63 stalls the chip's TX, so
   that's not a fix.) Putting the MACID to sleep from sta_notify
   doesn't help either: the register write is done within about 1 ms,
   but the chip keeps retrying the A-MPDU it has started.

4. What the vendor driver does differently. Realtek's vendor driver
   (rtl88x2cs v5.14.0.2-0-g4c549b2.20210914, built from
   https://github.com/friendlyarm/rtl8822cs, branch nanopi-r2, which
   FriendlyElec ships for this board) on a second board of the same
   kind has about one hole per run. Neither its firmware (9.13.0; with
   rtw88's 9.9.15 patched into its module it behaves the same) nor its
   power save handling (it only moves queued frames to a sleep queue)
   explains that. What does is its turbo EDCA (rtw_hal_turbo_edca()
   in hal/hal_dm.c, run from the driver's 2 s watchdog): it overrides
   REG_EDCA_BE_PARAM with CWmax 1023 (0x005ea42b with mostly TX,
   0x0000a42b with mostly RX), while rtw88's __rtw_conf_tx() writes
   mac80211's value, 0x005e642b (CWmax 63) with hostapd's defaults.
   Swapping the value on both drivers, alternating runs:

     rtw88 + series, CWmax 1023 (hostapd
       tx_queue_data2_cwmax=1023)          4 holes in 32 scans
     rtw88 + series, CWmax 63 (default)   25 holes in 26 scans
     vendor driver, CWmax 1023 (default)   3 holes in 16 scans
     vendor driver, CWmax 63              83 holes in 17 scans

   Throughput was the same with both values on both drivers.

A smaller second pattern remains with either value: when several MPDUs
of an A-MPDU are outstanding, the chip retries them together about 7
times and then drops the older ones after about 8 transmissions,
independent of REG_RETRY_LIMIT (WLAN_RA_TRY_RATE_AGG_LIMIT?).

I don't think rtw88 is wrong to apply CWmax 63: it's the value
hostapd documents as the AP's own default for BE, and mac80211 passes
it on as it should. CWmax 1023 only makes the retry chain long enough
for typical scan dwells; a client that stays away longer would still
lose the MPDU. The real gap is that the discard isn't reported: if
mac80211 learned that the MPDU failed, it would send a BAR itself and
the client's window would move on right away.

Ping-Ke, can the chip or the firmware report MPDUs it discards after
the retry limit (or send a BAR itself), in a way rtw88 could use
without requesting a TX report for every frame? Until there is a
fix, tx_queue_data2_cwmax=1023 in hostapd is a workaround for users.

>I checked the mac80211 status path, and it does send a BAR with the next
>sequence number for that QoS status. The current rtw88 report helper does
>not set AMPDU_NO_BACK, so requesting the reports alone would not exercise
>that recovery path.

Right. My experiment had an option for the driver to call
ieee80211_send_bar() itself when a report said the frame had failed,
but with so few reports coming back, that wasn't a usable path.

>One detail that might affect this experiment is that the sn passed to
>rtw_tx_report_enqueue() is a report cookie, rather than the frame's
>802.11 sequence number. It has six usable bits:
>
>        pkt_info->sn = (atomic_inc_return(&tx_report->sn) << 2) & 0xfc;
>
>As far as I can see, it repeats after 64 requests, and
>rtw_tx_report_handle() takes the first skb with a matching cookie. If an
>older request is still pending when its cookie is reused, a report for
>the newer frame can complete the older skb.
>
>Was the 7% figure from raw C2H events or from completed skbs?

From raw C2H events. That experiment didn't use rtw_tx_report_enqueue():
it put the low six bits of the frame's 802.11 sequence number into the
report field instead of a cookie, and counted every TX report the
firmware sent, before any matching.

An earlier test, which requested a report for one in 16 QoS data frames,
did use the normal cookie path, and there you're right: at that rate
the cookies wrap after about 50 ms, so its numbers (3-9 % answered) may
well be off. They agree with the raw count, though.

>This would
>affect frame attribution, but would not explain a shortage of raw C2H
>events. Maybe a short run with one request outstanding at a time,
>logging the cookie, QoS TID and seq_ctrl, would help check that part.

I tried that: a debug build that requests a report through the normal
path for one unicast QoS data frame at a time, and only sends the next
request once the report has arrived, or after 500 ms without one. The
client was a phone streaming video, for three minutes per run:

                                  run 1   run 2
  requests                          337     808
  answered                          258     750
  given up (no answer >= 500 ms)     79      58
    of these, answered later          0       6
  reports with another cookie         3       8

All answers reported success; in the second run the median time to the
report was about 4 ms. So even with only one request outstanding, 7 to
23 % of the reports didn't arrive within 500 ms, and nearly all of those
never arrived. I couldn't tie the missing ones to periods of heavier
traffic.

-- 
David Härdeman
