Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=125.209.209.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792960;
	b=UnZNcjXzFSgjVsyEos/RMvH3Hrjp7fyHc964F8xWnQn7C3i47+PIS5DedFOFnH9vMujL
	 EC1L+V7pQrHP+kYSoA8CqdJqyJrVAtDFOnvbwr3tnQ6dFIqXrsvM79AdppryriNzeVhha
	 iUXpHTjfRYNr+ew1f5ybxfyiNs/z+WRCX/VSRUgh21NSdXX4Eh8ZFBTggCsFz+UTd6mjL
	 R7bOQtbU927DTijvnOwMOhgirY+DOHE0tDYbdE6FPYBDEXXX8O1TkVITGgACHxCt6D/Hh
	 ZKRTfVLL7/9Y4r/5NX0s8+sh3eN84x5uGx55tQepFJxTToNJdy4P3SyfT+E2PcWVRtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792960;
	h=DMARC-Filter:DKIM-Signature:X-Originating-IP:Received:DKIM-Signature:
	 X-Session-ID:X-Originating-IP:X-Works-Send-Opt:X-Works-Smtp-Source:
	 Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RetrFWnvZP5Mgggv+M28fOB1san10GG9Bzp/OzYCugk=;
	b=Tiyyuv0SFgIOlON7PR5SGX+x8TxuIV2NPpM/7SxH0ctG7gkL8yWFH/2rFaTLYx5wsLMT
	 +iAuQ9awx72RQM7MpPy6KmD2Dh8q30RCXevULBj2O2XBcsqS77WDkd6Q930W8g6LBfuHp
	 Wi5lmdg89GfPWueZnylRdBunk0/uIb+MrTsuMEq6i258AZoTMBg9DqF4B3xDOw5C1ubvD
	 wrZEeUw/Uu5bpYR+sQp0l5cBBMdEePvRxAi4Z4umQHbAP8tojt9b1pRsVubvWwuOK3b8w
	 kaKEoDgR4/zsupqK1qVYtBM5z6YDslYn9vrOihfPfwuWe2DBmMCvq7+CW+muBMO2onw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=skku.edu;
	spf=pass smtp.mailfrom=skku.edu;
	dkim=pass header.d=worksmobile.com header.i=@worksmobile.com header.a=rsa-sha256 header.s=s20171120 header.b=NLOv93yW;
	dkim=pass header.d=skku.edu header.i=@skku.edu header.a=rsa-sha256 header.s=naverworks header.b=P32JMuc3;
	arc=none smtp.remote-ip=125.209.209.39
Received: from cvsmtppost101.wmail.worksmobile.com (cvsmtppost101.wmail.worksmobile.com [125.209.209.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D638C606A32D
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 15:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D638C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=skku.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skku.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=worksmobile.com header.i=@worksmobile.com header.a=rsa-sha256 header.s=s20171120 header.b=NLOv93yW;
	dkim=pass (2048-bit key) header.d=skku.edu header.i=@skku.edu header.a=rsa-sha256 header.s=naverworks header.b=P32JMuc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
	s=s20171120; t=1795792957;
	bh=gORjcgBBsLiHYv1Y+7MCY9UIj2bfHAN7gJr2zY9xNtg=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=NLOv93yWFc2P+GlPeSL4OFZ6f5jx4O1aT5MytKS/L42cT17GkF7AEt6wlqX6PEu/K
	 xAhUSMJ7OWJmzs9bAxT+lX3/Swoge5ljY982lgg79xrL2OWJNoXLV/gMSaUGmtvyvW
	 sz4dNYMKcvL95XBTg85d8Hsl8QFxVoS2+qTBRSOWrlpVvM1DLkKS/Q76DO6fDSQucz
	 YB4yXnt935C9iL/sWW8UCqAyLBpWuTR0iedhrHZ1eBCpeRrY/MOyODD0IJAbMSuMMe
	 uOhInRuPfMEZbQ9sruOBJ8r2DL3eI1Swr9yDk+hKAP7ayFCIfwFJqg5zmUCDkuMv+j
	 WUFFUJ+RldhFA==
Received: from kr1-hmac-real-5 ([10.174.201.129])
  by cvsmtppost101.wmail.worksmobile.com with ESMTP id eR5VmS56Rl+c8b6GKx34qw
  for <linux-wireless@vger.kernel.org>;
  Fri, 27 Nov 2026 15:22:37 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=skku.edu; s=naverworks;
	t=1795792957; bh=gORjcgBBsLiHYv1Y+7MCY9UIj2bfHAN7gJr2zY9xNtg=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=P32JMuc3TtVzqoA7eMfb2ci3BgqWylZJbo+1id5+wmyTX80h6S0le1lPmDuGiohfv
	 6XyG9M+zgHHo9sOHFO8CGxX7OiKgbxb19O0sE0VKGk9Bo9/M3W2cVFZ1DLEiAx76TC
	 qqPTa6CFDZ99avkavP6ZLqgFndVebjQDMcwv2OtXBoh/tII7EAj+UnRljYS6wUR75o
	 uVwl52kGuOD79s1xERwXmZKuzAczdbt8um1dUyjz0x57CFBG0wTNkArss6UyyWKXku
	 Q3UuI55yF1GmxyssuW5ygwPNJqoPDVlBcjWDBu+ktKr7S++OKri4fxD2tQ6qPPhBMm
	 wPm3Jyne/I5ww==
X-Session-ID: QDo78PI6TuexbY1W5Haydg
X-Works-Send-Opt: wXYXFqgmKAKmKAFYKqMqKA2mFAurjAumKAgmKxEmKqK/aAtwaBmmjAiYKxM/axKmKo2rFBwYjAg=
X-Works-Smtp-Source: AqKrFqElFqJZ+HmrFxEm+6E=
Received: from d20be28ee783.tail196be.ts.net ([115.145.173.180])
  by cvnsmtp102.wmail.worksmobile.com with ESMTP id QDo78PI6TuexbY1W5Haydg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Fri, 27 Nov 2026 15:22:36 -0000
From: Kyuwon Cho <kyuwon.cho@skku.edu>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH wireless] wifi: nl80211: don't add a link to a non-MLD AP that is beaconing
Date: Sat, 28 Nov 2026 00:22:36 +0900
Message-ID: <179579257178.2074758.820673964058548166@skku.edu>
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

nl80211_add_link() also turns a non-MLD AP that is already beaconing
into an MLD. cfg80211 keeps that AP in wdev->links[0], but mac80211
stops the default link and releases its channel context when the
interface becomes an MLD. Once the added link is removed again, the
interface is a non-MLD AP that cfg80211 still considers started, and
stopping it warns that its link has no channel context:

  WARNING: net/mac80211/chan.c:1380 at __ieee80211_link_copy_chanctx_to_vlans+0x480/0x5c0
   ieee80211_stop_ap (net/mac80211/cfg.c:2429)
   ___cfg80211_stop_ap (net/wireless/rdev-ops.h:202 net/wireless/ap.c:33)
   cfg80211_stop_ap (net/wireless/ap.c:65)
   cfg80211_leave (net/wireless/core.c:1666)
   cfg80211_netdev_notifier_call (net/wireless/core.c:1840)
   __dev_close_many (net/core/dev.c:2353 net/core/dev.c:2367 net/core/dev.c:1809)
   nl80211_del_interface (net/wireless/nl80211.c:5411)

Refuse to add a link while a non-MLD AP is beaconing; the links of an
AP MLD are added before it starts.

Fixes: 7b0a0e3c3a88 ("wifi: cfg80211: do some rework towards MLO link APIs")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Kyuwon Cho <kyuwon.cho@skku.edu>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. A reproducer, which runs as any
user with mac80211_hwsim built in (a non-MLD AP started on wlan0, link 1
added and removed again, then wlan0 deleted):

#define _GNU_SOURCE
#include <linux/genetlink.h>
#include <linux/nl80211.h>
#include <net/if.h>
#include <sched.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <unistd.h>

static int nl;
static char buf[8192];

static void *put(char *msg, int type, const void *data, int len)
{
	struct nlmsghdr *h = (void *)msg;
	struct nlattr *a = (void *)(msg + NLMSG_ALIGN(h->nlmsg_len));

	a->nla_type = type;
	a->nla_len = NLA_HDRLEN + len;
	memcpy(a + 1, data, len);
	h->nlmsg_len = NLMSG_ALIGN(h->nlmsg_len) + NLA_ALIGN(a->nla_len);
	return a;
}

static void put32(char *msg, int type, uint32_t v) { put(msg, type, &v, 4); }

static char *req(int fam, int cmd)
{
	struct nlmsghdr *h = (void *)buf;
	struct genlmsghdr *g = NLMSG_DATA(h);

	memset(buf, 0, sizeof(buf));
	h->nlmsg_len = NLMSG_LENGTH(GENL_HDRLEN);
	h->nlmsg_type = fam;
	h->nlmsg_flags = NLM_F_REQUEST | NLM_F_ACK;
	g->cmd = cmd;
	return buf;
}

/* send and return the error of the ACK */
static int xact(char *msg)
{
	struct nlmsghdr *h = (void *)msg;
	int n;

	send(nl, msg, h->nlmsg_len, 0);
	while ((n = recv(nl, buf, sizeof(buf), 0)) > 0)
		for (h = (void *)buf; NLMSG_OK(h, n); h = NLMSG_NEXT(h, n))
			if (h->nlmsg_type == NLMSG_ERROR)
				return ((struct nlmsgerr *)NLMSG_DATA(h))->error;
	return -1;
}

static int family(const char *name)
{
	char *m = req(GENL_ID_CTRL, CTRL_CMD_GETFAMILY), reply[8192];
	struct nlmsghdr *h = (void *)buf;
	struct nlattr *a;
	int len;

	h->nlmsg_flags = NLM_F_REQUEST;
	put(m, CTRL_ATTR_FAMILY_NAME, name, strlen(name) + 1);
	send(nl, m, h->nlmsg_len, 0);
	len = recv(nl, reply, sizeof(reply), 0);
	h = (void *)reply;
	a = (void *)((char *)NLMSG_DATA(h) + GENL_HDRLEN);
	for (len = h->nlmsg_len - NLMSG_LENGTH(GENL_HDRLEN); len > 0;
	     len -= NLA_ALIGN(a->nla_len), a = (void *)((char *)a + NLA_ALIGN(a->nla_len)))
		if (a->nla_type == CTRL_ATTR_FAMILY_ID)
			return *(uint16_t *)(a + 1);
	return 0;
}

static void up(const char *ifname)
{
	struct ifreq ifr = { .ifr_flags = IFF_UP };
	int s = socket(AF_INET, SOCK_DGRAM, 0);

	strcpy(ifr.ifr_name, ifname);
	ioctl(s, SIOCSIFFLAGS, &ifr);
	close(s);
}

int main(void)
{
	uint8_t head[] = { 0x80, 0, 0, 0, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
			   [10 ... 31] = 0, 100, 0, 1, 0,
			   0, 4, 'm', 'l', 'o', 'z', 1, 1, 0x82, 3, 1, 1 };
	const uint8_t l1[6] = { 0x02, 0xaa, 0, 0, 0, 0x01 };
	struct ifreq ifr = { .ifr_name = "wlan0" };
	uint8_t id = 1;
	int hw, nlf, wlan0, s;
	char *m;

	if (unshare(CLONE_NEWUSER | CLONE_NEWNET))
		return perror("unshare"), 1;
	nl = socket(AF_NETLINK, SOCK_RAW, NETLINK_GENERIC);
	hw = family("MAC80211_HWSIM");
	nlf = family("nl80211");
	m = req(hw, 4 /* HWSIM_CMD_NEW_RADIO */);
	put(m, 25 /* HWSIM_ATTR_MLO_SUPPORT */, NULL, 0);
	printf("NEW_RADIO (MLO): %d\n", xact(m));

	wlan0 = if_nametoindex("wlan0");
	s = socket(AF_INET, SOCK_DGRAM, 0);
	ioctl(s, SIOCGIFHWADDR, &ifr);
	memcpy(head + 10, ifr.ifr_hwaddr.sa_data, 6);
	memcpy(head + 16, ifr.ifr_hwaddr.sa_data, 6);
	m = req(nlf, NL80211_CMD_SET_INTERFACE);
	put32(m, NL80211_ATTR_IFINDEX, wlan0);
	put32(m, NL80211_ATTR_IFTYPE, NL80211_IFTYPE_AP);
	printf("wlan0 to AP: %d\n", xact(m));
	up("wlan0");
	m = req(nlf, NL80211_CMD_START_AP);
	put32(m, NL80211_ATTR_IFINDEX, wlan0);
	put32(m, NL80211_ATTR_BEACON_INTERVAL, 100);
	put32(m, NL80211_ATTR_DTIM_PERIOD, 2);
	put(m, NL80211_ATTR_BEACON_HEAD, head, sizeof(head));
	put(m, NL80211_ATTR_SSID, "mloz", 4);
	put32(m, NL80211_ATTR_WIPHY_FREQ, 2412);
	printf("START_AP (no link id): %d\n", xact(m));

	m = req(nlf, NL80211_CMD_ADD_LINK);
	put32(m, NL80211_ATTR_IFINDEX, wlan0);
	put(m, NL80211_ATTR_MLO_LINK_ID, &id, 1);
	put(m, NL80211_ATTR_MAC, l1, 6);
	printf("ADD_LINK 1: %d\n", xact(m));
	m = req(nlf, NL80211_CMD_REMOVE_LINK);
	put32(m, NL80211_ATTR_IFINDEX, wlan0);
	put(m, NL80211_ATTR_MLO_LINK_ID, &id, 1);
	printf("REMOVE_LINK 1: %d\n", xact(m));
	m = req(nlf, NL80211_CMD_DEL_INTERFACE);
	put32(m, NL80211_ATTR_IFINDEX, wlan0);
	printf("DEL_INTERFACE wlan0: %d\n", xact(m));
	return 0;
}

Without the patch, deleting wlan0 warns as above. With it, ADD_LINK
fails with EBUSY and nothing warns.

Found and tested on mainline 9437ee8b6cf6 (v7.4-rc4-571); the patch is
against wireless (35c42b20ac87).

 net/wireless/nl80211.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 1059c4aa539f..ec091452fc77 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -19673,6 +19673,9 @@ static int nl80211_add_link(struct sk_buff *skb, struct genl_info *info)
 	if (wdev->valid_links & BIT(link_id))
 		return -EALREADY;
 
+	if (!wdev->valid_links && wdev->links[0].ap.beacon_interval)
+		return -EBUSY;
+
 	if (!info->attrs[NL80211_ATTR_MAC] ||
 	    !is_valid_ether_addr(nla_data(info->attrs[NL80211_ATTR_MAC])))
 		return -EINVAL;
-- 
2.43.0

